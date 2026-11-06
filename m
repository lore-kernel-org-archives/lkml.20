Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.251.234.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982777;
	b=1QrquPczkAVKsF0fHyh5aD5kmJlEoNuXSukRU/tXY68RbWqMfthcdytCS4mV/kSoDHis
	 sZXyVNy2Fs8G2NezulUz5Pceg8M32lVkQMGpynivYHuFmPXHpdVB7r0Uv9tc6hpda4c+u
	 +RpKUH7jyMd4pYviNJvQehrK+x3PKR80xNOmXlY8hKbLT/wWdGUfd69JP6HzGJEENp6eq
	 4SRRWOfSXxiL0fEgigOzPYQY0PJanRZ1XWYsnElU9uW7BvILmmpuRYJto49+7z3q09nNJ
	 eNFtHvQiEZ2mBhvuG2zK28TXFriB+n+zwxgUyXijIOI/pY4xOCAFHUlEQ0ciBRipn5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982777;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:In-Reply-To:References:
	 X-Mailer:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:
	 MIME-Version:Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=lLUBX5NMh3rR49KCC8Gxk3yDlocbPIa0NzFM5Ifv0t8=;
	b=uwDvgkholvZW+5VuL1XVT0PxpqeqB88uCDjX01nW+WcLmqWD3dtoANDYlyGv59WCewpN
	 qyrLH1lqOSVyw7uzbTn/xkofm1m6g2ky6oCCMeddm7cyY+QZdKFlATsgIpzA4in7mRb6/
	 tDvUQQJ/sZbTFtDaK15c1/nEDpvLEAoNiQUYY3uhmP7sUA+1K6BqSeqtQlVdnpNUI7vsP
	 kDmDDN3Zh4hBjWup2EVL7t30/hdcYuCCAXT/FjsLJeCEXYgYKAKMB9Br7zRA1qxOGMfBC
	 RV9VsSNyqJOWOFZRaPhjBJvMJoQr+Ulht3GoTtjAEn0Th5Dlz7Sf2d66NV0muZxVlhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fqwqf.xyz;
	spf=pass smtp.mailfrom=send.fqwqf.xyz;
	dkim=pass header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=apOKf2r1;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=kRT9NGdM;
	arc=none smtp.remote-ip=23.251.234.53
Received: from e234-53.smtp-out.ap-northeast-1.amazonses.com (e234-53.smtp-out.ap-northeast-1.amazonses.com [23.251.234.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080E7606D810;
	Fri,  6 Nov 2026 16:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 080E7606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=apOKf2r1;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=kRT9NGdM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1793982775;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=c0tUZAaaLfmv6reKw3GkgRVoEuHn/RALQcxVbTokSu8=;
	b=apOKf2r1V8C0VlJ0HaaWLxU9CPqcBvN2SIm7E8zxh8Xt9/CAhUXFRj7D6l9dgWQp
	5u41Dl5DU6P6+CbI6h88cXQE6Beyor1ZCjA+sDmFdpx/sBvdpUCdoyKtllGgb92bpw/
	78nITWN5i8y6Gcyh4HtEo1gbfgSwLSJSu07C9Ark=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1793982775;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=c0tUZAaaLfmv6reKw3GkgRVoEuHn/RALQcxVbTokSu8=;
	b=kRT9NGdMjGOB7hiPXURNUb8dsHNY0UWA1cV8nTaOYnztzPlmXjU8xvalVngBCXT1
	+cMT/M9cXnL+0oeyM841D7L2PicQAxsxnCVf2mU2KdUHsGw8pYbM2OKivUmPiASiZ8B
	7hyYoYjucsixsbde+fJWklDS897fNebck29eq5us=
In-Reply-To:
 <CAFEp6-2vZT+c9fz2Ob1LvPQBjChOpCdAYa0qAWCyiDg3s4d0LQ@mail.gmail.com>
References:
 <CAFEp6-2vZT+c9fz2Ob1LvPQBjChOpCdAYa0qAWCyiDg3s4d0LQ@mail.gmail.com>
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: loic.poulain@oss.qualcomm.com, xiaqinghuan@mail.ustc.edu.cn
Cc: bod@kernel.org, hverkuil@kernel.org, todor.too@gmail.com, 
	gjorgji.rosikopulos@oss.qualcomm.com, vladimir.zapolskiy@linaro.org, 
	mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: qcom: camss: stop started subdevices when
 stream-on fails
Message-ID: <010601a1b1b4c10a-5e87fd76-771d-44aa-9a2e-0755e5e1ff0f-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 6 Nov 2026 16:32:55 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.11.06-23.251.234.53

Hi Loic, Qianhui,

Thanks for the pointer. I have read v2 2/2 [1]; it =
covers the ordinary
start-failure cleanup addressed by my patch, and =
sharing the traversal
with stream-off makes sense.

There is one remaining difference: camss_video_subdevs_set_stream()
returns immediately on a disable error. If A and B start successfully,
C fails to start, and stopping A then fails, B is never stopped. Normal
stream-off also stops walking at that first error.

I reproduced this with the actual helper and injected subdevice errors.
The increment below keeps the first stop error and continues cleanup;
start still returns immediately, and video_start_streaming() retains the
original start error if cleanup also fails. It applies on top of your
v2 2/2. With this covered, my earlier standalone patch can be superseded.

The helper and the actual video start/stop functions pass 416 ASan/UBSan
cases covering partial starts, multiple stop failures, ignored states
and pipeline/format errors. With the unmodified helper, the stop-error
case leaves B enabled. The ARM64 W=3D1 camss-video.o build passes. These =
are
software tests; I have not replaced the running camera driver to test
the combined change on hardware.

Would you fold this into your next =
revision? I have left the multiple
source-link question to the existing =
discussion with Bryan.

[1]
https://lore.kernel.org/all/20261031041154.=
308030-3-xiaqinghuan@mail.ustc.edu.cn/

Signed-off-by: Jizhou Tong =
<fqwqf@fqwqf.xyz>
---
diff --git a/drivers/media/platform/qcom/camss/camss-=
video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 9a633ca066..31d608d9a0 100644
--- a/drivers/media/platform/qcom/camss=
/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -268,12 +268,16 @@ static int video_prepare_streaming(struct vb2_queue =
*q)
  * subdevice without a streaming operation reports -ENOIOCTLCMD, which=
 is
  * ignored here to match the previous .s_stream() call sites.
  *
+ * Start stops at the first error. Stop continues through the pipeline =
even if
+ * a subdevice fails, so one failure does not prevent cleanup of =
the others.
+ *
  * Return: 0 on success, or the error code of the first =
subdevice that failed.
  */
 static int camss_video_subdevs_set_stream(stru=
ct camss_video *video,
 					  bool enable)
 {
 	struct media_entity =
*entity =3D &video->vdev.entity;
+	int first_error =3D 0;
=20
 	while (1) {
 		struct media_pad *pad;
@@ -296,13 +300,17 @@ static int =
camss_video_subdevs_set_stream(struct camss_video *video,
 			ret =3D v4l2_subdev_disable_streams(subdev, pad->index,
 							  BIT_ULL(0));
=20
-		if (ret && ret !=3D -EALREADY && ret !=3D =
-ENOIOCTLCMD)
-			return ret;
+		if (ret && ret !=3D -EALREADY && ret !=3D =
-ENOIOCTLCMD) {
+			if (enable)
+				return ret;
+			if (!first_error)
+				first_error =3D ret;
+		}
=20
 		entity =3D pad->entity;
 	}
=20
-	return 0;
+	return first_error;
 }
=20
 static int =
video_start_streaming(struct vb2_queue *q, unsigned int count)
