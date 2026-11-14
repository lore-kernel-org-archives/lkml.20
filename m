Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794625444;
	b=EeRTstT4pFPS+h9HtVg/aPEbEx2vYhSomuNHXzXocmCpSq5hyYN8DXQ3+7B42FHKT58z
	 PJkYljJRDMyMogr9YkYBy5YHrznEqIJda9t8YJtL5PMhfmdBUSlLqmt6rOIsAVA5Z0cg9
	 Yur7mx8w1hFgbr9axBzj2Y2Hoogcnwo2jCGxhcZ1hUhhy2hkloIu/x0TapvDVw8rG9Ddb
	 gkizowRMkLJgENrGmcNbxPSvVxbc+qYJGnskWFsB/Rokn2g/QsUgLyU88UAYtalUeP9Qi
	 inTEJcnHGVcmgCZwxJvGwk7I3NHm2uZrJaf4IJ2IWlLPHVvLn+/sS4flupkCc6GsPag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XWwADe8GLoNoLjF/oyz1/OFei2FLfxnSw0Wa2LHuGjY=;
	b=Wmp1jkUJl25kUJgkXU25/3/IpYFQPSf9SUYtwBuCT4sVbJpoOJwhZVidlKn0udPIIVBX
	 t5svPSAGE6Lza5tsqzsz98ReTamc9t/NsUwAQRHoDaZOId6V+obEqv55XyqSu291PdjWd
	 z0IUZsG/dVgXA0UonurjprbKppguSS7Xg1EDRQ/uYVHbXjhhU8Lj8+qEVoMapGKqEWRq8
	 pJE4kjpVZz7ekXkLGZywWvYCMH2RKce33amVlsLhh0uloUVnBjH1FARB0CwfHWKeRWa28
	 Dz7qpjhjvLmbHiTYchxHQo4/VBW5qiJBlvScp6cU0OISURpais2bFb0kNgWA6Z4tzfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rPIZp877;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C137606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C137606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rPIZp877
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ec20398b05so2131034e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:04:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794625443; cv=none;
        d=google.com; s=arc-20260327;
        b=Te+bwWHtC1C6A2OkacVibh7RCUUo38Fsfyn+a3xMN6FUD1yxfXLd9Ehx5lKja6lCNh
         h+/AHJ1K9MjwhDZYIHy06PhUiE32WQ42w8cq/kRVZNfP+3tFHCIfIdsHwjtKLKpieUSh
         U0S2KkRR5gr0AtqNzPS3kz6T9Kfq7QrE3NDd18eI/j3t98IhlnolK5crRna2lVdlGNQC
         lrXf+BUQFzFR3vncEJVHu9eb0/4ulJNJlo98rsB5UWEwZH2Ia5aF0ZJVM8X5CXlrdQ3f
         GnT8/DgiMVdCBkBjODUleiDslcOOUtDCZLIpACG84GmvioLKpg2yxaBdhZqmuJen0n4q
         eE0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XWwADe8GLoNoLjF/oyz1/OFei2FLfxnSw0Wa2LHuGjY=;
        fh=tmxTm2mFz8W0ec4b2Y820j8xxtRgQrbvN5zpwiJOOfk=;
        b=Yfzab8GjFbvnrMHHqBv8B8N7CGePk0wKaaa/0btnWg3yGJUceg1kcHbGouHBDES5c0
         JtvGtz7hnieeRNd5xCtfkTclcerohlddeWyH2KKCgUetamQbJYmJ+KRTfER3XVTPnzIG
         lCAJw72g8iX1OVkoTNBmBhjGl81HMNuYWjhQQXGG4mlZHWtrMIlTInhCIZ9Bql27r6QA
         mClZN2WZEi4s156KW2iOWt5/RNlnMROLG/v+9jfOGT/VrfDywSERrsEUfe0Mr0swRqz7
         R1MkCekMlCQcarTUNkZs7ocjvYf852Z0bV/WvLX0vNAdZ30lCGDyB4mUMewKJnoZNuEQ
         dbNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794625443; x=1795230243; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XWwADe8GLoNoLjF/oyz1/OFei2FLfxnSw0Wa2LHuGjY=;
        b=rPIZp877tbQadrv2K4Vdny2mnTvgojabbH0pC89G2N2VXWK2UblCcwVNZnefVmWrsh
         qi8EocyWwaeNwOMdyUWP+CMR+ku25SIAled6uR8iy9DP4MHF9U5TCuPjhrRzqbwjStN8
         GI3bvyaEYihscGofjMcWbaNmgumQwpVRxWrz4qHFkL5tDUvP31SR66hWFe1cjadhMbF/
         PXus2w3cNWiXDNJyZU+rTznOBnwZNnJmrf7JieXiAiuPR7kcwwfZYPSu08DxR7LYMTlI
         ogsqbdxph1x2Ux63+q5OdhjCFUQQdY3KwtXvW5PQCaQFRT4erJTdDyehBBT2tVJTj1jw
         KuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625443; x=1795230243;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XWwADe8GLoNoLjF/oyz1/OFei2FLfxnSw0Wa2LHuGjY=;
        b=Thz5h7LItgHuJWSoeyrKoZaZmntxu3F4cFt2yoDDTwFX3iR3GUXVgZzetBl9te6g2T
         E+eNDSGHn4etyosaYiqpeqMokc2mT0pZt8m0qpj4x50Dd/WNhjJStn9gltmHlpS9mIr+
         NsA8kZmq7SwdqCs+GFupiTxCu1ajJlkGXGHvU+DiWBrzjFAxrlWPdrpix6qj2Fpy4cyc
         O98f15JGVgvKKDBmZZVizXgwXQqa9QUyXUhGHKMh6RIbzbCeRoZqIJ5lZmzCW8kbVkXP
         DxZBl0gJ8MG3Wngs56p2gey3z8pzQz8j1kAXLQgxYW5VUSPXaAjc2MPw+WzxST+R59QV
         vSRA==
X-Forwarded-Encrypted: i=1; AL+hErHIG7nFUUovsdY2PC3Q9mcwDqtdHqpradICl/UhqgcR0KdwAdInX10vKdSIogSPrG7xy+WoD2yW+XFNuZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VFD3yIsJbXV3hdvVlDIEmghtXI0h6bR0vvYf/iDxc2DZzK408
	2lzOe2PatCBlG7HpAs83U7faETgwOxxw5VIpM1mKckRBVWWkWXNbF8kEWWaLkoGeft5nk4qSO1Q
	NQcIWoTY5qqZJRi7Y0eNHzZ3VwPaX83k=
X-Gm-Gg: AYBFou2m4xGxUBx65uym/x7vCugHrDLpoRi7uk7LFIZLPJSsyrzhxHlMSrffSFB1h4E
	OK7mb5NW5Se+22mIrJG6s1XfTj1TmkxoiwNCnQEtbBmKqFIObsXw8TEDQd71DIGlo3Q9Kq4g5zj
	hEYpeIT+LLgDqJcciPNOIJIbLeIKr7O0P3MaIDNkM0Qko8hW94WHuaa7CCu84+pwdltwX8jbCjM
	dv3rU/s/bks9Dv1YDQgFoTNONuRWnRVo6ZefGJYpB/hujXeWdzHRe8x3Q1wSacjZ1jjvbl2zdQ4
	iHvlOiqswu+BdhRtqzNeoRK4hJjEzsP9h0rc74s5JKrLnBIT1uEDNDEJ5DOhqsT5ByZr+R0b8kt
	8Jt8KUaZ7D139kXKDIqWViPdKI43Sgne8poU=
X-Received: by 2002:a05:6122:62a6:b0:5e5:1be6:e12c with SMTP id
 71dfb90a1353d-5ee34adabf7mr1759772e0c.21.1794625443218; Fri, 13 Nov 2026
 19:04:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260827201611.99825-1-tchatard@gmail.com> <be6f70a3-5792-4a4b-9f03-591869fb9786@uni-koeln.de>
In-Reply-To: <be6f70a3-5792-4a4b-9f03-591869fb9786@uni-koeln.de>
From: Thierry Chatard <tchatard@gmail.com>
Date: Fri, 13 Nov 2026 19:03:52 -0800
X-Gm-Features: AclHuK_QHGedDaTSz4ALKjerOXJxyF7FrgwajFWtVN2oN2T1srpeliyS_lJ87qM
Message-ID: <CAB9TEqztrZ5TqRd3-iJpYiHBzK2rCh-jC9=XkTut1OV+Jf4Qag@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] Enable cameras on Dell Latitude 5285 2-in-1
To: meisena2@uni-koeln.de
Cc: andriy.shevchenko@intel.com, djrscally@gmail.com, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, jacopo.mondi@ideasonboard.com, lee@kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, mchehab@kernel.org, 
	nicholas@rothemail.net, platform-driver-x86@vger.kernel.org, 
	sakari.ailus@linux.intel.com, v.vitovt@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Matthias,

Thanks a lot for testing on the 5290 and for the detailed report - great
that the front camera already comes up.

One thing worth flagging: the 5285 series has since been merged upstream
(mainline as of 7.4-rc1 - the mfd quirks via Lee's tree, the int3472 board
data and the media bits via the media tree). So there's no open series to
extend anymore; 5290 support would be a small follow-up on top of mainline
rather than an addition to this thread.

From your report the 5290 needs the same two pieces the 5285 did, so I
suggest two short patches:

1) mfd: intel-lpss: add Dell Latitude 5290 to the resource conflict quirk
- just another DMI entry in intel_lpss_quirk_dmi[]. This replaces the
acpi_enforce_resources=lax stand-in you used, so please test with the
real quirk entry rather than the boot parameter. Goes via Lee's tree.
Template: the 7275 commit that did exactly this,
495d5f41a6161dffafe61ac458459c62d440344a.

2) platform/x86: int3472: tps68470: add board data for Dell Latitude 5290
- a DMI entry in int3472_tps68470_board_data_table plus the board data.
Template: the 5285 board-data commit e605a094ff7a.

Two suggestions before sending:

- Please coordinate with Vitalii Tytskyi (CC'd) - his 5290 tree already
has 5290 board data and covers the rear camera (OV8858), so it is
better to reuse/validate that than to reuse the 7212 data. That also
gets the rear camera tested, which I think is still open on your side.

- Since you have the hardware, it is best that the patches come from you
(and/or Vitalii) with a Tested-by on the actual 5290 - board-data and
quirk patches really want to be tested on the machine, and I cannot do
that for the 5290.

I'm happy to review and give a Reviewed-by on the mfd quirk.

Thanks again,
Thierry

On Fri, Nov 13, 2026 04:04 PM, Matthias Eisenacher
<meisena2@uni-koeln.de> wrote:
>
> Hi Thierry,
>
> Thanks for this work. A short report from a Dell Latitude 5290 2-in-1
> (same platform as the 5285), in case it helps to extend this series
> to the 5290.
>
> I did not apply this series. Instead I tested the minimal changes
> needed for the front camera on the 5290:
>
> - Linux Mint 22 (Ubuntu 24.04 base), kernel 7.0.0-43-generic (HWE)
> - Added a DMI entry for "Latitude 5290 2-in-1" to
>    int3472_tps68470_board_data_table, reusing
>    dell_7212_tps68470_board_data
> - Booted with acpi_enforce_resources=lax as a stand-in for your
>    intel-lpss quirk. Without it I get the same I2C4 conflict as on
>    the 5285:
>
>    ACPI Warning: SystemMemory range 0x00000000FE028000-0x00000000FE0281FF
>    conflicts with OpRegion 0x00000000FE028000-0x00000000FE028207
>    (\_SB.PCI0.GEXP.BAR0)
>    intel-lpss INT3446:00: probe with driver intel-lpss failed with error -16
>
> With both changes the front camera (OV5670/INT3479) works: cam -l
> lists "Internal front camera (\_SB_.PCI0.LNK0)", and I get video via
> libcamerasrc/GStreamer and in Zoom (via libcamerify). The rear camera
> was not tested.
>
> DMI: sys_vendor "Dell Inc.", product_name "Latitude 5290 2-in-1",
> board 09WJPW.
>
> So the 5290 seems to need the same intel-lpss quirk plus board data.
> Vitalii's tree has 5290 board data; would it make sense to add the
> 5290 DMI matches to this series or to a follow-up? I'm happy to test
> patches on the 5290.
>
> Thanks,
> Matthias
