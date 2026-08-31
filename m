Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE6539B94F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160136; cv=pass; b=kfy2GN/m9qacP9MJNtrz0CEPBYR2fM7I4X7/muTsMKQkoDY0R+jUehm0u5NaoJk2+tCZKt2Kqjxjsi4Q2g9TIRRH61NyKMsTf3IvO7DQwX+is5C5QM0mWcTCPcg8wmt+49bYAJO2AmZv3vgsHOAKvIlIrtUUdeYnFiOnCe0oZ90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160136; c=relaxed/simple;
	bh=gb3KqlSFbybppNERwIDUGbtRdT8/09q/+jNEPJrI6SY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RKFiOCPPCs+7Ckmbs7TH/Jq7FzjK2UMa09/lgtnlhy7PNnNg75Els5MWenIU9AS3EjXC1UudcLcNVTxPGKvmMcbMj5VTKA5LsKH4J9io6s9avStKsEZH8lkZ2Go42rdZ4b/kQ4qSCfyEPv6ss7KW+6enkWLDoC9Pbqj8e5wJVCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qjsPF6Pw; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qjsPF6Pw"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c08df8513so19863341cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:08:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788160134; cv=none;
        d=google.com; s=arc-20260327;
        b=P3FMTP5QrJCYxn3v+md+k8YshLVHcXisFS5vFXoTqTFFQN+XwtXss2hQ++bfetEGW+
         LGGZzThDOCsFa+HnjN9/iJTPi2fF3NdYbWpM9HPxatAUWw2CVXZPvtCo8cn09goD4r6l
         9gZw2i/vIYYnptjuWiPd6g7jVri8AoB8w1nFvytBozvEJZev7GK2V8wnr8Xu2/q/YzCc
         NjoIkkQKF20eb+AAnlnpTAlYXxJCVXrBFBF08umefet5HL7fjEoSf+KdjfufPooxnkAV
         7DTFKnpmYhVJ72MzjKUJtJHyP1dPTmxFqFnuccMcUyR4HdW+gDe2NGsXLuoVDim6GTIR
         1EYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=gb3KqlSFbybppNERwIDUGbtRdT8/09q/+jNEPJrI6SY=;
        fh=IR2dcMm3UrNF8EKHaIpKzQQD8JAVnRGyPFHnlu8wM/M=;
        b=IxWiyHf1+pLB3bvFygECEYcfCvMbcDB4H0Jz+w1fWDWl4Rnr3wn1TEt1TeUSa+3DcN
         pkpCV6vfwKEvbp/3JZMRWdxnrpdRwjtpXkcvHctjbcNBjdxmce4Wzuv+hteBfyCNthoc
         I8fkuixp52+fa/ydh67VEUoKJY2tzGfEeftggI32TeyCGADbyVl8txS7EXk+2DsUOM5v
         SIgiu7Hf8UlL5PIpAenaWCSt8StaxRFTWxH97hLPr/xuXE9GFt6MqM3muyWDZHLiYqVi
         4xpdWvopE8KHMPQaHlZSMEQS4dENl4nj51xf/BP/ZATUJQHkGKoPQSBju5RCWqOfQgJg
         Xy3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788160134; x=1788764934; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gb3KqlSFbybppNERwIDUGbtRdT8/09q/+jNEPJrI6SY=;
        b=qjsPF6PwYhFnSCKHqAuXTDdWyN9xNgoaVsT3QYlEh9T6Exaj3muIsJihN6hySjFnJl
         mwn9ccuP8y5uqz2GW9rK4UzDx1V/iDeRSJ6uRjeIgFgTTln2xpsO3Iih31GSWv0wx2lq
         VPr6IEYJNfBP+2hUpSWC39JdnGViYkOpERe6DOXrsEoWR4CYbTJ3asJRIaEEwtIOGAul
         WlXt1JXDJVfnGMWfvcoZrSANREWHZ9XxeG4n/bZ52CllsoCf91UrK3CaWWJmkJXmWTBz
         TO/C+oghf0k7C/Sf/VuSld4Ht5dGykJB5f+FO9qfY7CzjLBz2M0AYGuYm/6Tx16xclWz
         kaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788160134; x=1788764934;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gb3KqlSFbybppNERwIDUGbtRdT8/09q/+jNEPJrI6SY=;
        b=k8+SY/JGzbFA9ybh0dlBKXF1aqcdvoOjlSgY7CaxCL8SVG8Nvprp4i5paIr48GRhgb
         E2En8qp6sH2cnCtHh7Ssx27zWEqeCiF+lpB0tdrHotVpnR9B5s0SsQXPyiG0TRxlW1eI
         yFNnWqkQsyNhnS9dyg4R6Bzx9Yb3sAmSoD0mYMzFtWYKakeCcgYOMgj3VpDFT50yZJTO
         6tDb0ImnHhtKmX52VjuggmAv3uqF53qJ2x9cH56QKkgstUGvjDaQzS1JSZWxJoP0FuF2
         FQKIgfZeGCOLTEQn/2DG+Xs5rowDd84a27ZihZJDzyTiiQmYKH9wLUCbfcxy6DF/81AE
         t63A==
X-Forwarded-Encrypted: i=1; AHgh+RoVWxfmrDiYugGfdXGts1doRutE18dv4OMjli+Ex9fFfTpJ2JACNqNaMih84wV9tNgZeSDcFuD5gMyNfg4=@vger.kernel.org
X-Gm-Message-State: AFuF++lZXBhCzdyVPx86Y5txtHvvTOs1VWYwgz2Zp42bfBsIoQsHcSfr
	L80kyPWOuclhDQ6v9pRsGxiX6oWven6Xwq2akQFUh+SzCWYAa306p39X1VgsDC3xzgMKnYJBt3D
	IN8x7yXReJnBzDbKmF1Kxr1XvEnFBnXo=
X-Gm-Gg: AR+sD128UPUnzAQwKrJx/cHxgWbeR/9nisM+CHgfiTJAfBdW3vusD434sSb39LJrQmS
	EGimVFbvZUPNNKHBE4ImDCjFuIxX2HI96WrC8IcRyFDqPlZD/CrWjpHHhgcGrE0eluTHjWJmaV2
	q9ha+iyqq/4IF/0GmgTQukeEzx8TsG7dy8RPrddA72cjAUL4yDGiV+Qhu90kLFkATM0m8NMrtI8
	QVTLVZRtYfXGWbre45e4gNEeyxmfmQ3ZKNezgsdcNTx4bFWPdbZ8Y+4P9Z8NB/Mpx8khlXhzZa0
	uPIWVWUIZmpQ3nHPIMnoK3XXMx0yPBgDHpIAY8hcFDG7XgUNsYeaKnxFHlUd+Ny7sgkfQxQoIbH
	0Zur/fWpey73APy4KW6ZVLh0RCyU70y7XMhPF8Z582N/7m8UX
X-Received: by 2002:a05:622a:22a4:b0:52f:b6cf:9143 with SMTP id
 d75a77b69052e-52fb972a984mr290081371cf.40.1788160133449; Mon, 31 Aug 2026
 00:08:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: ZW Tang <tangzw515@gmail.com>
Date: Mon, 31 Aug 2026 15:08:41 +0800
X-Gm-Features: AcwNN1XM7_rdJuW_svwUnK6b2aR6FDT8FcsJjIoke4mi9H1xv3U-85ZmZfcP8P0
Message-ID: <CAA2SOT57R46O--S5nCj73Tu1pJ1cVhrHD=h=ovqPusAAk7Lr6g@mail.gmail.com>
Subject: [BUG] wifi: mac80211: WARNING in __rate_control_send_low during scan
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am reporting a warning triggered by a syzkaller reproducer on
Linux 7.2.0-rc3. A similar issue appears to have been reported before, but
I can still reproduce it on Linux 7.2.0-rc3 with HEAD commit
1137d8b5df06137fb49513cc923b3b24d94cb809.

The reproducer uses nl80211 to trigger a scan on wlan1 with crafted scan
attributes and flags, including TX_NO_CCK_RATE. During scan work,
mac80211 builds and transmits a probe request. The transmit path reaches
ieee80211_tx_h_rate_ctrl(), rate_control_get_rate(), and then
__rate_control_send_low().

At that point mac80211 reports that there are no supported rates for the
station under the current rate mask and flags, and then triggers a warning
in net/mac80211/rate.c.

This looks like a mac80211 scan/rate-control robustness issue. A crafted
scan request can produce a combination of band, rate mask, station rates
and scan flags for which no usable rate remains. The kernel should avoid
triggering a warning in this case, for example by not applying the normal
rate mask to scan probe requests or by rejecting the scan parameters
cleanly, because panic_on_warn turns this into a kernel panic.

Reproducer:

syz reproducer:

r0 = socket$nl_generic(0x10, 0x3, 0x10)
r1 = syz_genetlink_get_family_id$nl80211(&(0x7f0000000200), r0)
ioctl$sock_SIOCGIFINDEX_80211(r0, 0x8933,
&(0x7f0000000700)={'wlan1\x00', <r2=>0x0})
sendmsg$NL80211_CMD_TRIGGER_SCAN(r0, &(0x7f0000000340)={0x0, 0x0,
&(0x7f0000000300)={&(0x7f0000000740)={0x84, r1, 0x5, 0x48000, 0x0,
{{}, {@val={0x8, 0x3, r2}, @void}}, [@NL80211_ATTR_BSSID={0xa, 0xf5,
@from_mac}, @NL80211_ATTR_SCAN_SSIDS={0x10, 0x2d, 0x0, 0x1, [{0xa,
0x0, @default_ap_ssid}]}, @NL80211_ATTR_SCAN_FLAGS={0x8, 0x9e, 0x202},
@NL80211_ATTR_IE={0x4}, @NL80211_ATTR_SCAN_FLAGS={0x8, 0x9e, 0x1000},
@NL80211_ATTR_MEASUREMENT_DURATION={0x6, 0xeb, 0x2},
@NL80211_ATTR_SCHED_SCAN_RSSI_ADJUST={0x6, 0xf7, {0xf, 0xfe}},
@NL80211_ATTR_MEASUREMENT_DURATION={0x6, 0xeb, 0x2},
@NL80211_ATTR_SCAN_SSIDS={0x1c, 0x2d, 0x0, 0x1, [{0xa, 0x0,
@default_ibss_ssid}, {0xa, 0x0, @default_ap_ssid}]},
@NL80211_ATTR_TX_NO_CCK_RATE={0x4}]}, 0x84}}, 0x0)
r3 = socket$nl_generic(0x10, 0x3, 0x10)
r4 = syz_genetlink_get_family_id$nl80211(&(0x7f0000000080), 0xffffffffffffffff)
sendmsg$NL80211_CMD_REMAIN_ON_CHANNEL(r3, &(0x7f0000000480)={0x0,
0x60, &(0x7f0000000140)={&(0x7f00000002c0)={0x1c, r4,
0x9c3fa077fa966179, 0x0, 0x0, {{0x7e}, {@val={0x8}, @void}}}, 0x1c}},
0x0)

console output: https://pastebin.com/raw/Q3vbBYc1
kernel config: https://pastebin.com/raw/YWdYitkv

Kernel:

HEAD commit: 1137d8b5df06137fb49513cc923b3b24d94cb809
git tree: torvalds/linux
kernel version: 7.2.0-rc3 #1 PREEMPT(full) (QEMU Ubuntu 24.10)

Relevant log:

no supported rates for sta 08:02:11:00:00:00 (0xf, band 0) in
rate_mask 0xffffffff with flags 0x10

------------[ cut here ]------------
WARNING: net/mac80211/rate.c:399 at
__rate_control_send_low.isra.0+0x619/0x770, CPU#1: kworker/u8:3/53

CPU: 1 UID: 0 PID: 53 Comm: kworker/u8:3 Not tainted 7.2.0-rc3 #1 PREEMPT(full)
Hardware name: QEMU Ubuntu 24.10 PC (i440FX + PIIX, 1996)
Workqueue: events_unbound cfg80211_wiphy_work

RIP: 0010:__rate_control_send_low.isra.0+0x62b/0x770

Call Trace:
<TASK>
rate_control_send_low+0x12b/0x870
rate_control_get_rate+0x1bd/0x5b0
ieee80211_tx_h_rate_ctrl+0x7b6/0x19e0
invoke_tx_handlers_late+0x1000/0x2830
ieee80211_tx+0x2f3/0x460
ieee80211_xmit+0x308/0x3e0
__ieee80211_tx_skb_tid_band+0x2e2/0x7c0
ieee80211_scan_state_send_probe+0x36a/0xb10
ieee80211_scan_work+0x834/0x1d80
cfg80211_wiphy_work+0x31f/0x740
process_scheduled_works+0x5ed/0x1c90
worker_thread+0x5be/0xd20
kthread+0x404/0x530
ret_from_fork+0x7c5/0xde0
ret_from_fork_asm+0x1a/0x30
</TASK>

Kernel panic - not syncing: kernel: panic_on_warn set ...
