Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F82B412C08
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788458730; cv=pass; b=LU/wXrIbMES2I+ZfKVU6BHFJN2HmFngXeVh7Yl0u2D1S1Pw5hwJQjg6z8h8sxA4DP37XXmcMUIbdBkJyF8CFygIxKhkN02bsskXd+rfZeSZAvngVmJ5t6FhqLaZWAKuSJZnljwkhBFcbvjaQxRLIRsF6GBr6R2ptT0RbBjNihGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788458730; c=relaxed/simple;
	bh=Kedqy20iL1VKqlMTRtx4HVaP26Qjm1i0y2pTcLCn1Bo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=PX8n+QNOPjJq8wItFPH2jqfnI+JgUXM9VTqHGbwtpxwXOcMlcZ+61DKD/efBiOAPkcWDJKDwH3IDg6T/A0mUgcmcJL4RzIkRuwlRwP/E8Coe+zlSPPYxVYRyqkZCAZfvV70/xM8zRiLX3KHIjoGS9ljzjVzScIfu1mPo/sQU5oI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pTCZGd9F; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pTCZGd9F"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so30661a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:05:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788458726; cv=none;
        d=google.com; s=arc-20260327;
        b=Ni7PfBDaxcwCC83rtFoEdVsUC6URgraX5FPK/BVNL+UHizPJWsytOwtf66Y2H6BcYC
         tdyIdnG9IMwIL4nMBvhLtfhMH+o2R1RmIYe4lfaJxsJxrUCewlDR73CFiaUi/HMbNb05
         qJuJ/q3n3dBAUZ3g/mugJ5ktLR2KUJJ5ahHNbsZ28RNOvlBYL5cWPCVKKT9h6VkL21wo
         aj7Y9ZxmXYkw/UC4mwqFYsHM+e69xCV8qBiQQTCJ1H+TQBD3bCQ4omsQKNVeG42hT4De
         hj1EYXqD8z2z2AwMpH1Zbq0X3CfHrZhcJSRtgzBIv90z/sVI/npztUXwfLpPKQ8/XAH3
         MbAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ouLdnCY2g+cfVI1uQbvBpUc2m70NxffWFhYFj+R3y1Q=;
        fh=f+ghNHuGgN9bX7f3yNe4Fb0ayiefQIdtcmRiTgwC4mI=;
        b=fLAVIBpDJl98dZJfP9+IO0T5aK6WTu8rQ4WoIpULxDwOSU1dj17XhjhGbcc7QM5Ah/
         o+hxENsGzJzU+dORbMO2YKtg3ZZBN5ggDLZa0WMgDlyqaqmwzwpP57ccMqQfX4MJNK6Y
         ZkLatM9pe8mSEP2L1/Wx4OnT/dBeGYpVhzsMbRTrHyfdmwhYsxQqwuPgeyK4uQ7fTVqh
         MhunGl6vXg7PM7MIN6A/G5BO3awJBdKjbaWCqgUs/U0Ikfyb/HnEx8R2nDpWYZ/79usm
         h3njmt+U4utojYO8tD7W3U6utdvmZvMACLy0Tagg4Pf6DJpdJfGdsJn9LvKqHvRdkq09
         Xxgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788458726; x=1789063526; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ouLdnCY2g+cfVI1uQbvBpUc2m70NxffWFhYFj+R3y1Q=;
        b=pTCZGd9FP1IhxPnjKk6E66Ddlp4m5GqUiNPbDyqJchmZrfYoXl15Hap+A55w+zSWHc
         paRX8zSl/BjFDnDPhDDC1Ye3YfBcyTM4gCwNTPgjRvyPg5EN3prpjdGFsSicYRg5iu+2
         L3W5dGzRcNMm+Q1bnAY0twMPqV+7GIjrreNWSs6lCqwtldSPxx94icjoq0CUvirl8Wf0
         LCExRp9L4tFJiR6HA9mMl2fJGPc6oiW7SRZ2sbuFPDMABsLbnXi2Is4pBNVDDBDXdGQm
         bll4fps4wn1S3CmI0JUvOpOtTGqDEOvmlLNLwiw5xCeJpiIk+wwZbauyV5BQrobSprlM
         eO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788458726; x=1789063526;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ouLdnCY2g+cfVI1uQbvBpUc2m70NxffWFhYFj+R3y1Q=;
        b=Bz9h/yYX2/9aLoIavno9Cu4M0umsnMmJs46JKyqa3PggmSFneIW2rq/WuK0tVTLT3i
         UlTHA6i7fojKEKYHrgQd8+5q20zuJoR8evRPzUg5817IzbuX5dImp1vSg7Dtsw+KTf71
         DEt0OT+WRD4RlGCEN30Z+cHlNnnotlPnP3phXrOUdgMz6nFBIreH3yJL9s5ajd4o8Sx7
         b6nHHgnfs5m7NhmSTMKz2UjAWzCoo6sTYnt4mTPED1jw8HSAop7CIpcPWd107eVHlx96
         TFspkDy4+fyeoKfqXN5cgVCrzh50XUMDYCL2oHcenn5Hvir2dWwQrxrvqzD/yaWHqEjF
         C3jw==
X-Forwarded-Encrypted: i=1; AKwUvBwgBIgGUciF7x1bsh1fmLrN1xrOY9L4LeALuNR+wShCZuYYZZMwex67alH+gn5d/dQqsABMajAOjIlOsN0=@vger.kernel.org
X-Gm-Message-State: AFuF++kUdMryQLkG0e4k9VizMSjf3/KqKpj1XSPX4fEQllgYSzSGtHfK
	JPqqzT+eNe8ZrHbR6ZObvXfxSNMLYKBVXx9MTGLduvTSghtdBQ06oDJ+yKRFnKD7XJu7G7GI2b1
	z2SIOseNMQo2pgcCTcKOs0RUZ4+appbQ=
X-Gm-Gg: AYBFou1enXalxsoKmEbqIb8fj/TyjZqBpK/feoEq4R7TphZ1zwLcuywj4darI3W+Ds8
	2j3kM42YXMWokXpp+T4momF5gSLPWjhFwW+Tbmz/sno4mEx5sXB7Y9FKG5XZjuw030gs9fbtPT7
	GnYEtPZM83ZS3fsW9d0oTIJ9ptcd9zxUYhZuNj5TdCinFGyH4ZqHokshyL2F4NFpdvaYs7gD+Ne
	ju4kpRsS9rUqsCl9uPkkBYkOEc8q0iEuMQCcA4zGSSpLeptd/vnlLhhsTfH7sgJKSiqDAYm+ulb
	5JUcIx8/RNFpByfQ+I+hjN8qF4zYf1sgsPmm2K1klBkVxhU1XIHEbXgfB8Oasq6ekQAnnK/gTJV
	ymB7I4sQo3TkhbF1RcPv1Z7fH24oATZqx7ocPD4+u/yT1HMOzoai7Uzp4Pgps44fq
X-Received: by 2002:a05:6402:46c6:b0:6a3:87b7:b5a9 with SMTP id
 4fb4d7f45d1cf-6a7e5604d15mr1334240a12.12.1788458725896; Thu, 03 Sep 2026
 11:05:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Suraj Theekshana <surajtheekshana1111@gmail.com>
Date: Thu, 3 Sep 2026 23:35:13 +0530
X-Gm-Features: AcwNN1Vt6Tc8y4Do8D2u35EyFOWok_1twivnhW8FthoSUho74voiB0U_yD-wAQA
Message-ID: <CA+_JcNS4PREBDzqmnHSu6h5jqfK=NiX5J+14JY-JDaegoQ2xLw@mail.gmail.com>
Subject: greybus: CAP IMS/auth memcpy not capped to ioctl buffer
To: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: security@kernel.org
Content-Type: multipart/mixed; boundary="0000000000000dae61065a97ffe2"

--0000000000000dae61065a97ffe2
Content-Type: multipart/alternative; boundary="0000000000000dae60065a97ffe0"

--0000000000000dae60065a97ffe0
Content-Type: text/plain; charset="UTF-8"

Hello,

I am reporting an unbounded memcpy in the Greybus CAP driver.

Product: Linux kernel
File:   drivers/staging/greybus/authentication.c
Header: drivers/staging/greybus/greybus_authentication.h
         include/linux/greybus/greybus_protocols.h
Tree:   torvalds/linux 8ab1afb

Observed
========

cap_get_ims_certificate() and cap_authenticate() do:

  *size = op->response->payload_size - sizeof(*response);
  memcpy(dest, src, *size);

The response buffer is allocated with gb_operation_get_payload_size_max()
and GB_OPERATION_FLAG_SHORT_RESPONSE.

The ioctl destinations are fixed:

  certificate[CAP_CERTIFICATE_MAX_SIZE]  /* 1600 */
  signature[CAP_SIGNATURE_MAX_SIZE]      /* 320  */

There is no check that payload_size >= sizeof(*response)
and no cap to 1600 / 320.

A 2048-byte payload therefore copies:

  IMS:  2048 - 1  = 2047 bytes into certificate[1600]
  AUTH: 2048 - 65 = 1983 bytes into signature[320]

A payload shorter than the response header wraps the unsigned subtract and
memcpy uses a huge length.

Expected
========

Reject payload_size < sizeof(*response) (-EMSGSIZE).
Reject copy length > CAP_CERTIFICATE_MAX_SIZE /
CAP_SIGNATURE_MAX_SIZE (-E2BIG).

Reproduce (no Greybus hardware)
===============================

  git clone --depth 1 https://github.com/torvalds/linux.git
  # tree used: 8ab1afb

  gcc -fsanitize=address -g -O0 -fno-builtin -U_FORTIFY_SOURCE \
    -I gb-poc \
    -I linux/drivers/staging/greybus \
    -I linux/include/linux/greybus \
    gb-poc/poc_cap_headers.c -o poc_cap_headers

  ./poc_cap_headers
  ./poc_cap_headers auth

ASan excerpt (IMS)
==================

CAP_CERTIFICATE_MAX_SIZE=1600 CAP_SIGNATURE_MAX_SIZE=320
[IMS] payload=2048 dest=1600 mode=ims
=================================================================
ERROR: AddressSanitizer: stack-buffer-overflow
WRITE of size 2047
    #0 memcpy
    #1 cap_get_ims_certificate  poc_cap_headers.c:18
    #2 main                     poc_cap_headers.c:61
Address is located in stack of thread T0
  This frame has 2 object(s):
    [48, 481) 'a'
    [560, 2173) 'ims'  <== overflows certificate[1600]
SUMMARY: AddressSanitizer: stack-buffer-overflow in memcpy
ABORTING

ASan excerpt (AUTH)
===================

CAP_CERTIFICATE_MAX_SIZE=1600 CAP_SIGNATURE_MAX_SIZE=320
[AUTH] payload=2048 dest=320
=================================================================
ERROR: AddressSanitizer: stack-buffer-overflow
WRITE of size 1983
    #0 memcpy
    #1 cap_authenticate  poc_cap_headers.c:26
    #2 main              poc_cap_headers.c:54
Address is located in stack of thread T0
  This frame has 2 object(s):
    [48, 481) 'a'  <== overflows signature[320]
    [560, 2173) 'ims'
SUMMARY: AddressSanitizer: stack-buffer-overflow in memcpy
ABORTING

The PoC includes greybus_authentication.h and
greybus_protocols.h from this tree. It is not a live
CAP_IOC_* ioctl and there is no in-kernel KASAN frame.

Impact
======

Local overflow in the CAP ioctl path if a CAP connection exists and a
module answers GET_IMS_CERTIFICATE or AUTHENTICATE with an oversized or
truncated payload.
Not unauthenticated remote RCE. Same trust model as a malicious or buggy
Greybus module.

Files in the attached zip
=========================

  poc_cap_headers.c
  ktypes.h
  asan_ims.txt
  asan_auth.txt


Regards,
Suraj Theekshana

--0000000000000dae60065a97ffe0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hello,<br><br>I am reporting an unbounded memcpy in the=
 Greybus CAP driver.<br><br>Product: Linux kernel<br>File: =C2=A0 drivers/s=
taging/greybus/authentication.c<br>Header: drivers/staging/greybus/greybus_=
authentication.h<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include/linux/greybus=
/greybus_protocols.h<br>Tree: =C2=A0 torvalds/linux 8ab1afb<br><br>Observed=
<br>=3D=3D=3D=3D=3D=3D=3D=3D<br><br>cap_get_ims_certificate() and cap_authe=
nticate() do:<br><br>=C2=A0 *size =3D op-&gt;response-&gt;payload_size - si=
zeof(*response);<br>=C2=A0 memcpy(dest, src, *size);<br><br>The response bu=
ffer is allocated with gb_operation_get_payload_size_max() and GB_OPERATION=
_FLAG_SHORT_RESPONSE.<br><br>The ioctl destinations are fixed:<br><br>=C2=
=A0 certificate[CAP_CERTIFICATE_MAX_SIZE] =C2=A0/* 1600 */<br>=C2=A0 signat=
ure[CAP_SIGNATURE_MAX_SIZE] =C2=A0 =C2=A0 =C2=A0/* 320 =C2=A0*/<br><br>Ther=
e is no check that payload_size &gt;=3D sizeof(*response)<br>and no cap to =
1600 / 320.<br><br>A 2048-byte payload therefore copies:<br><br>=C2=A0 IMS:=
 =C2=A02048 - 1 =C2=A0=3D 2047 bytes into certificate[1600]<br>=C2=A0 AUTH:=
 2048 - 65 =3D 1983 bytes into signature[320]<br><br>A payload shorter than=
 the response header wraps the unsigned subtract and memcpy uses a huge len=
gth.<br><br>Expected<br>=3D=3D=3D=3D=3D=3D=3D=3D<br><br>Reject payload_size=
 &lt; sizeof(*response) (-EMSGSIZE).<br>Reject copy length &gt; CAP_CERTIFI=
CATE_MAX_SIZE /<br>CAP_SIGNATURE_MAX_SIZE (-E2BIG).<br><br>Reproduce (no Gr=
eybus hardware)<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><br>=C2=A0 git clone --depth 1 <=
a href=3D"https://github.com/torvalds/linux.git">https://github.com/torvald=
s/linux.git</a><br>=C2=A0 # tree used: 8ab1afb<br><br>=C2=A0 gcc -fsanitize=
=3Daddress -g -O0 -fno-builtin -U_FORTIFY_SOURCE \<br>=C2=A0 =C2=A0 -I gb-p=
oc \<br>=C2=A0 =C2=A0 -I linux/drivers/staging/greybus \<br>=C2=A0 =C2=A0 -=
I linux/include/linux/greybus \<br>=C2=A0 =C2=A0 gb-poc/poc_cap_headers.c -=
o poc_cap_headers<br><br>=C2=A0 ./poc_cap_headers<br>=C2=A0 ./poc_cap_heade=
rs auth<br><br>ASan excerpt (IMS)<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<br><br>CAP_CERTIFICATE_MAX_SIZE=3D1600 CAP_SIGNATURE_MAX=
_SIZE=3D320<br>[IMS] payload=3D2048 dest=3D1600 mode=3Dims<br>=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>ERROR: AddressSanitizer: stack-buffer-=
overflow<br>WRITE of size 2047<br>=C2=A0 =C2=A0 #0 memcpy<br>=C2=A0 =C2=A0 =
#1 cap_get_ims_certificate =C2=A0poc_cap_headers.c:18<br>=C2=A0 =C2=A0 #2 m=
ain =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p=
oc_cap_headers.c:61<br>Address is located in stack of thread T0<br>=C2=A0 T=
his frame has 2 object(s):<br>=C2=A0 =C2=A0 [48, 481) &#39;a&#39;<br>=C2=A0=
 =C2=A0 [560, 2173) &#39;ims&#39; =C2=A0&lt;=3D=3D overflows certificate[16=
00]<br>SUMMARY: AddressSanitizer: stack-buffer-overflow in memcpy<br>ABORTI=
NG<br><br>ASan excerpt (AUTH)<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br><br>CAP_CERTIFICATE_MAX_SIZE=3D1600 CAP_SIGNATURE_MAX_SI=
ZE=3D320<br>[AUTH] payload=3D2048 dest=3D320<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<br>ERROR: AddressSanitizer: stack-buffer-overflow<br>WRI=
TE of size 1983<br>=C2=A0 =C2=A0 #0 memcpy<br>=C2=A0 =C2=A0 #1 cap_authenti=
cate =C2=A0poc_cap_headers.c:26<br>=C2=A0 =C2=A0 #2 main =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0poc_cap_headers.c:54<br>Address is located i=
n stack of thread T0<br>=C2=A0 This frame has 2 object(s):<br>=C2=A0 =C2=A0=
 [48, 481) &#39;a&#39; =C2=A0&lt;=3D=3D overflows signature[320]<br>=C2=A0 =
=C2=A0 [560, 2173) &#39;ims&#39;<br>SUMMARY: AddressSanitizer: stack-buffer=
-overflow in memcpy<br>ABORTING<br><br>The PoC includes greybus_authenticat=
ion.h and<br>greybus_protocols.h from this tree. It is not a live<br>CAP_IO=
C_* ioctl and there is no in-kernel KASAN frame.<br><br>Impact<br>=3D=3D=3D=
=3D=3D=3D<br><br>Local overflow in the CAP ioctl path if a CAP connection e=
xists and a module answers GET_IMS_CERTIFICATE or AUTHENTICATE with an over=
sized or truncated payload.<br>Not unauthenticated remote RCE. Same trust m=
odel as a malicious or buggy Greybus module.<br><br>Files in the attached z=
ip<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br><br>=C2=A0 poc_cap_headers.c<br>=C2=A0 ktypes.h<br>=C2=A0 asan_im=
s.txt<br>=C2=A0 asan_auth.txt<br><br><br>Regards,<br>Suraj Theekshana</p></=
div>

--0000000000000dae60065a97ffe0--
--0000000000000dae61065a97ffe2
Content-Type: application/zip; name="gb-cap-poc-8ab1afb.zip"
Content-Disposition: attachment; filename="gb-cap-poc-8ab1afb.zip"
Content-Transfer-Encoding: base64
Content-ID: <f_mtlt5s490>
X-Attachment-Id: f_mtlt5s490

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
AQAA3gwAAAAA
--0000000000000dae61065a97ffe2--
