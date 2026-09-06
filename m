Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159693BED32
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 17:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788715775; cv=pass; b=WBBcID1fJmP9QWtlr3dgMlqqUOBJ56X95jDm07ZSIpafY9DPaXde14oaZudv0BZKBbhs2DWAsf309BAHE3kMIm81S8sjthzvp4yQb9vDVTdD0GusJoEy9IPrkvgrj1mq2dCAScjg6vcRKYXQ49ZYh2iHKWt1xiC/wmNv2dwrDCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788715775; c=relaxed/simple;
	bh=exym+CZzgOAab18t0m2mPm0HSQCgKgYLWUwmIDyopsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=C/KCwEuy22JUJSPLZyozaUCfsYHiKhp7ki/KmtSIYuZRcCpweT4SphonLTqoLb21dmNS44VlYjXAEbKfiZNcKrqZ9kE5KNzC46aaKPO3ls2EMg0v6ZIj4R02yb9IxGhfm2sa0pR8Y4IrX+nDCNVTqZ27nmXgnyVq+f8Cc/xmZMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHxjiQ4Z; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHxjiQ4Z"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b5e907853eso2790554e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 10:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788715770; cv=none;
        d=google.com; s=arc-20260327;
        b=hADfKGrJe8zZnv6ZtOpeZK92Pw0YC38KUlyunY3hMs+ew+GxQ6h7ujUm/hHfT6nN/K
         D0NCruSwNqeppdbW0KfpsJ2568yXZes8bpsF5DAbaGKJ6d25GAmNZpd4PmduZ04UNoZV
         T7QgkwBbpt/o+T6LTaolKeBah6jgsKNiGDUrD88qMNwyYHgv6wVmfzVe65LdFB498UTh
         9f4QAUACaOMPTmWG5RoXnnstWGhdSrP0nkDZlopfc3h/lvPeVEYfTJ7hl1+zIwK/OC2W
         bdqimk06Umj7LeZWMNPiEAVdVldFV7VzhM28hw1/ilmEgnXtzTAWxzTMNonWZIWQUiJC
         xMDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=2tjcZmJsdmQErzdeSLKiFZt5uiqLR+LZOBvmbBrdCHM=;
        fh=AK+5cwZf0tsinnPC7x/3xm+V8f4uBm6qlenW1cmyqAQ=;
        b=IOw+Brpi89VNATDhsvcBXROqUF6S28q425LlBghPDumdB6rk6RMBh1wuFdvcOFIcnM
         alcto/rRcNC6ZCVSlPHLtZ0DfKG7E3syoEE7ogajA0S2OqjnTwAdNyyT2VO/p9pFXfjD
         vs+FnXKrWAstzx4wWpyt4uQbjeADkAH6XsfWAWCTkAX7UbwagW4ZUPG82o04PVky49jU
         +ZsXle0ZzeRzbxdQLtCTah3AiVwqj70GBi/E7F8G3HWHgn9tLfKNNe0PxL3aHF/SID7w
         tJ473Q1cLrhEGlAirOjjkqDiGM+aiib/6ARrlwdTrQN4QTWQQJaiCFfnNqVELy2kLNA0
         OHOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788715770; x=1789320570; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2tjcZmJsdmQErzdeSLKiFZt5uiqLR+LZOBvmbBrdCHM=;
        b=WHxjiQ4ZkoRITNJr1V+K4L997+wlgYofvZUc7h1uKaz7tIBH7xTFJ2/h1YGyfPuCZQ
         t8yx4NFz16+osUIhAhZnAClh9eE4e2+WaBX/QZ6BzhG3cbYf1R5U28dBYdUp5SyVOAss
         7M5Uw6KVrWwgQEg1M8gkS2Ogf/oEJjJNB3ujKZMBu3dSqks9Q1zx1WzH7QS+BLUQ9LEk
         oBACLUAh9k+0HqaIxKAx1COTpY41vSLKH62AZ+wSmHdapEfaAOSkfHkUTflO886GA4K7
         yzeGXw3bK9ldqV3kn8v8tbSNFYkzw5yBvKp6nMiuB8elywJeztlPfMuGQSvudxS2+c5Q
         mQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788715770; x=1789320570;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2tjcZmJsdmQErzdeSLKiFZt5uiqLR+LZOBvmbBrdCHM=;
        b=lchYuWGs739XuSq8lSpjla1o/y3My4bkku0V71n3kGyxfX1akYZogo7HFgOt3mhto7
         ZfvELbrOIcfyfjxVYnVpU2iPWb+13MEgkWuhFjN8tm0dDMwCqk/HBSkaFgj/vAA04FK5
         owUSsWx9q9ysveVP/kuykm0HwnsLR/zSVyoajoW2P077pzdjoghnWVUJSh9Uegbs3UqR
         93kyYi24tlYA/RezsB71GTb3MDXtpROpmw2JmGfbdsrRkUJsq/7T1eI3rN1tAioJuvYI
         jl7Zmts5+W10+g2ljFVUQbRUXP8i3+D+PPDsDE0tpvuM1V05TKIOZgTMdoT6mbGuHgvq
         PBjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvJDVXasSrWh6kld5JcPv2+sfxt+bxT6xKQDnR3ShkacoXdRNwTsEvyEadYQKmMrsKvzJpURUN4LkS/LY=@vger.kernel.org
X-Gm-Message-State: AFuF++keSbrualPY7z0AGlqBZBDS4s9OVY+4pTcWELeS2wmcWZjnVHWX
	onOcj9ye/2SPR8JnQ8uVjcMipdUr9TAbLMjxGpycYpYZWXK35Xr2I7PoR+GArTMHovP3RLPg0l1
	7hHXRS9RW734+bxrKiuWowWLWqWeUnUI=
X-Gm-Gg: AYBFou0YFHMpW3OG3NThEUbNbp6N0CGvPnkWj8elFPxuy5u3KR2wdJ6X1QRk/PZSdtL
	uruwyNT6VGWU2gaFqwC6CHxobmfDSf2ZV48wN6R8alCvO646QMwQQrJ9qC45g+b655T+9viUARI
	ONDbx9KWlRWwKc70hZFq+1rM9iUFxNX9urE7ZF+beDJczIXquwd8k5St+H/+fR2QaGgxpklAXEe
	qEaJ0jd9tHblHvZKKs7+EvleIlWcsX93XkymFdKviQA308gF0SmvltR/sISdOCf1Y950bGmIZPa
	XClFT/GsaWlYxb74ZUacFAnubh+DGCv9hwiQWhob1kCYMYxlFyEKMUUuMeLPA4cQiKLJg3PJgFA
	MdgzG2yNNGB8LWt1cut2c
X-Received: by 2002:a05:6512:104a:b0:5b5:f946:513c with SMTP id
 2adb3069b0e04-5b616f32605mr2925330e87.17.1788715769404; Sun, 06 Sep 2026
 10:29:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMnMt5YMA70FJwH+ddo24Ejd8HbpFSgUv73Ybu-fu+F-gcoesQ@mail.gmail.com>
 <CAMnMt5Y_fL0cHQ1CjU9+vn0rZVO5eitL6h0dTQ5Wg48c68-yYg@mail.gmail.com>
 <CAMnMt5Y5gKSYk3HjNhdBGZQCg3OwsZ714ZbROzuw_=KVaX0bHQ@mail.gmail.com> <CAMnMt5YgEf2MkDu+wpRi8uR2LJddwSjbji=AzT59zbV5Qzzs-w@mail.gmail.com>
In-Reply-To: <CAMnMt5YgEf2MkDu+wpRi8uR2LJddwSjbji=AzT59zbV5Qzzs-w@mail.gmail.com>
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Sun, 6 Sep 2026 20:29:21 +0300
X-Gm-Features: AcwNN1VdeF1bNJ1n6crGjHyWxRd2O_6m6j9TJLIJkTjz3E99bnAStAX9QJTjAyQ
Message-ID: <CAMnMt5afuw8G7U35kPUUJqWAtaNxcoHj=GvHg+6Kk=XRwhs9hw@mail.gmail.com>
Subject: [PATCH] wifi: mt7601u: add vnd_reset parameter to fix probe failure
 on Tenda U2
To: kuba@kernel.org, kvalo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000000a3836065ad3d833"

--0000000000000a3836065ad3d833
Content-Type: multipart/alternative; boundary="0000000000000a3833065ad3d831"

--0000000000000a3833065ad3d831
Content-Type: text/plain; charset="UTF-8"

On certain MT7601U adapters, such as Tenda U2 and
other newer hardware revisions, driver initialization consistently fails
during probe with vendor request timeouts (-110 / -ETIMEDOUT):
  mt7601u 3-14:1.0: ASIC revision: 76010001 MAC revision: 76010500
  mt7601u 3-14:1.0: Firmware Version: 0.1.00 Build: 7640 Build time:
201302052146____
  mt7601u 3-14:1.0: Vendor request req:07 off:09a8 failed:-110
  mt7601u 3-14:1.0: Vendor request req:02 off:09a8 failed:-110
  mt7601u 3-14:1.0: Vendor request req:07 off:0734 failed:-110
  mt7601u 3-14:1.0: Vendor request req:42 off:0230 failed:-110
  mt7601u 3-14:1.0: probe with driver mt7601u failed with error -110

The failure occurs because mt7601u_load_firmware() unconditionally calls
mt7601u_vendor_reset() (MT_VEND_DEV_MODE_RESET) before uploading firmware
chunks. On these devices, issuing this vendor reset leaves the internal
MCU / FCE DMA engine in an unresponsive state after the first firmware
URB is submitted. As a result, reading MT_TX_CPU_FROM_FCE_CPU_DESC_IDX
(0x09a8) immediately times out.
Introduce a boolean module parameter 'vnd_reset' (default: false) to
make this vendor reset optional. When the vendor reset is skipped,
firmware upload succeeds and the wireless interface initializes normally.

Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1716301

More issues with Tenda U2 and Linux:
- https://www.opena.tv/viewtopic.php?t=63919
- https://askubuntu.com/questions/1418850/the-problem-with-wi-fi-u2
- https://bbs.archlinux.org/viewtopic.php?id=224859
-
https://www.reddit.com/r/archlinux/comments/1d6dfv5/mt7601u_usb_wifi_not_working/

Signed-off-by: Herman Semenoff <GermanAizek@aizekgroup.ru>

--0000000000000a3833065ad3d831
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On certain MT7601U adapters, such as Tenda U2 and<br>other=
 newer hardware revisions, driver initialization consistently fails<br>duri=
ng probe with vendor request timeouts (-110 / -ETIMEDOUT):<br>=C2=A0 mt7601=
u 3-14:1.0: ASIC revision: 76010001 MAC revision: 76010500<br>=C2=A0 mt7601=
u 3-14:1.0: Firmware Version: 0.1.00 Build: 7640 Build time: 201302052146__=
__<br>=C2=A0 mt7601u 3-14:1.0: Vendor request req:07 off:09a8 failed:-110<b=
r>=C2=A0 mt7601u 3-14:1.0: Vendor request req:02 off:09a8 failed:-110<br>=
=C2=A0 mt7601u 3-14:1.0: Vendor request req:07 off:0734 failed:-110<br>=C2=
=A0 mt7601u 3-14:1.0: Vendor request req:42 off:0230 failed:-110<br>=C2=A0 =
mt7601u 3-14:1.0: probe with driver mt7601u failed with error -110<br><br>T=
he failure occurs because mt7601u_load_firmware() unconditionally calls<br>=
mt7601u_vendor_reset() (MT_VEND_DEV_MODE_RESET) before uploading firmware<b=
r>chunks. On these devices, issuing this vendor reset leaves the internal<b=
r>MCU / FCE DMA engine in an unresponsive state after the first firmware<br=
>URB is submitted. As a result, reading MT_TX_CPU_FROM_FCE_CPU_DESC_IDX<br>=
(0x09a8) immediately times out.<br>Introduce a boolean module parameter &#3=
9;vnd_reset&#39; (default: false) to<br>make this vendor reset optional. Wh=
en the vendor reset is skipped,<br>firmware upload succeeds and the wireles=
s interface initializes normally.<br><br>Link: <a href=3D"https://bugs.laun=
chpad.net/ubuntu/+source/linux/+bug/1716301">https://bugs.launchpad.net/ubu=
ntu/+source/linux/+bug/1716301</a><br><br>More issues with Tenda U2 and Lin=
ux:<br>- <a href=3D"https://www.opena.tv/viewtopic.php?t=3D63919">https://w=
ww.opena.tv/viewtopic.php?t=3D63919</a><br>- <a href=3D"https://askubuntu.c=
om/questions/1418850/the-problem-with-wi-fi-u2">https://askubuntu.com/quest=
ions/1418850/the-problem-with-wi-fi-u2</a><br>- <a href=3D"https://bbs.arch=
linux.org/viewtopic.php?id=3D224859">https://bbs.archlinux.org/viewtopic.ph=
p?id=3D224859</a><br>- <a href=3D"https://www.reddit.com/r/archlinux/commen=
ts/1d6dfv5/mt7601u_usb_wifi_not_working/">https://www.reddit.com/r/archlinu=
x/comments/1d6dfv5/mt7601u_usb_wifi_not_working/</a><br><br>Signed-off-by: =
Herman Semenoff &lt;<a href=3D"mailto:GermanAizek@aizekgroup.ru">GermanAize=
k@aizekgroup.ru</a>&gt;</div>

--0000000000000a3833065ad3d831--
--0000000000000a3836065ad3d833
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-PATCH-wifi-mt7601u-add-vnd_reset-parameter.diff"
Content-Disposition: attachment; 
	filename="0001-PATCH-wifi-mt7601u-add-vnd_reset-parameter.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_mtq369xp0>
X-Attachment-Id: f_mtq369xp0

LS0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2MDF1L21jdS5jIHwgMTUgKysr
KysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2MDF1
L21jdS5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3NjAxdS9tY3UuYwppbmRl
eCBiYWQ2Y2E4MjEuLmFiZjQ3NjdmMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3Mv
bWVkaWF0ZWsvbXQ3NjAxdS9tY3UuYworKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRl
ay9tdDc2MDF1L21jdS5jCkBAIC0xMCw2ICsxMCw3IEBACiAjaW5jbHVkZSA8bGludXgvZGVsYXku
aD4KICNpbmNsdWRlIDxsaW51eC91c2IuaD4KICNpbmNsdWRlIDxsaW51eC9za2J1ZmYuaD4KKyNp
bmNsdWRlIDxsaW51eC9tb2R1bGVwYXJhbS5oPgogCiAjaW5jbHVkZSAibXQ3NjAxdS5oIgogI2lu
Y2x1ZGUgImRtYS5oIgpAQCAtMjEsNiArMjIsMTQgQEAKICNkZWZpbmUgTUNVX0ZXX1VSQl9TSVpF
CQkJKE1DVV9GV19VUkJfTUFYX1BBWUxPQUQgKyAxMikKICNkZWZpbmUgTUNVX1JFU1BfVVJCX1NJ
WkUJCTEwMjQKIAorc3RhdGljIGJvb2wgdm5kX3Jlc2V0OworbW9kdWxlX3BhcmFtKHZuZF9yZXNl
dCwgYm9vbCwgMDY0NCk7CitNT0RVTEVfUEFSTV9ERVNDKHZuZF9yZXNldCwgIlBlcmZvcm0gdmVu
ZG9yIHJlc2V0IGR1cmluZyBmaXJtd2FyZSB1cGxvYWQgKGRlZmF1bHQ6IGZhbHNlKSIpOworCitz
dGF0aWMgYm9vbCBkaXNhYmxlX3VzYl9zZzsKK21vZHVsZV9wYXJhbShkaXNhYmxlX3VzYl9zZywg
Ym9vbCwgMDY0NCk7CitNT0RVTEVfUEFSTV9ERVNDKGRpc2FibGVfdXNiX3NnLCAiVW51c2VkIGNv
bXBhdGliaWxpdHkgcGFyYW1ldGVyIik7CisKIHN0YXRpYyBpbmxpbmUgaW50IGZpcm13YXJlX3J1
bm5pbmcoc3RydWN0IG10NzYwMXVfZGV2ICpkZXYpCiB7CiAJcmV0dXJuIG10NzYwMXVfcnIoZGV2
LCBNVF9NQ1VfQ09NX1JFRzApID09IDE7CkBAIC00NTksOCArNDY4LDEwIEBAIHN0YXRpYyBpbnQg
bXQ3NjAxdV9sb2FkX2Zpcm13YXJlKHN0cnVjdCBtdDc2MDF1X2RldiAqZGV2KQogCW10NzYwMXVf
d3IoZGV2LCAweDk0YywgMCk7CiAJbXQ3NjAxdV93cihkZXYsIE1UX0ZDRV9QU0VfQ1RSTCwgMCk7
CiAKLQltdDc2MDF1X3ZlbmRvcl9yZXNldChkZXYpOwotCW1zbGVlcCg1KTsKKwlpZiAodm5kX3Jl
c2V0KSB7CisJCW10NzYwMXVfdmVuZG9yX3Jlc2V0KGRldik7CisJCW1zbGVlcCg1KTsKKwl9CiAK
IAltdDc2MDF1X3dyKGRldiwgMHhhNDQsIDApOwogCW10NzYwMXVfd3IoZGV2LCAweDIzMCwgMHg4
NDIxMCk7Ci0tCgo=
--0000000000000a3836065ad3d833--
