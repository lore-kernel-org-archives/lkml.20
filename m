Received: from mail-10699.protonmail.ch (mail-10699.protonmail.ch [79.135.106.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE3855C1B7
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789063746; cv=none; b=sZt1RHyjGQK1/ghVZ7LKXx03O09sbr3h7Aybq8czREB6mPgcO2JMA1Yuc/dAvEhJW65N2E/pckDLGaKNY/sQS5OrJrRs0Zshzb4ID5OJRJ0/4yC9f7BnNL3NYXrjaOEMf7/oL7oAsnGS3+cw7TJi4bk7kgl0TeNhylqdls2psAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789063746; c=relaxed/simple;
	bh=mR/DAY2vioPzeVAm250nz2mhuErFnhJX7v2W9wjjva8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PXM9hUYX1iJBJG3OiJ9k+asDXy77JX3uGalICh5LpsFbereibwlgv9JHVY127R7KA99rPcxGue44kZF20o6lZPm++pcWcY4OsJkMvESanK9hkxdYFBSxEC1SL+GL5xKixaohHzxcSD72PzLP+FR/+pJohXNZMyOjjycxbZExklQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=lRYGnypg; arc=none smtp.client-ip=79.135.106.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="lRYGnypg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1789063734; x=1789322934;
	bh=/TGmrt7DQ3mPK72IszjZ09gHVIOLgSzkYdtDkfG0Tos=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lRYGnypg+fdwYgr+aDCNCn/HdTfcidkIXCKYXVwbN7RVNP59te3uSHaNpmTDJJpBS
	 vnfcYyDXhEowdX5IS30dT7qXJoL0OOAKXFqXPOkvmfd27rlWdtGdKcG8nDJ6mrT8DZ
	 kIvMokzBdPBgJ8sqr0syCYoIQIXl21YfSqeMRKakes+wHPPqyFMy2c8M3kHAb0dQ5J
	 fGUTh/0plYEXRW6FC7FkC5bigVK02QkUrqqbV57FALMRt0OkML/EVN9Lmq1qvfWUrv
	 KKwUxqAHAWDEyS1nSXF1FFnPfRjHU7g9c8zvPULqmHHbvKShPNzW2Gv1bAT6hG0gF+
	 szhCRcanH18AQ==
Date: Thu, 10 Sep 2026 18:08:48 +0000
To: "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>
From: contectforbusiness@proton.me
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "rmfrfs@gmail.com" <rmfrfs@gmail.com>, "johan@kernel.org" <johan@kernel.org>, "elder@kernel.org" <elder@kernel.org>, "greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>, "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: greybus: camera: fix potential overflow in debugfs buffers
Message-ID: <Fl0v3Y5q1hoeNzFDtQUUvhQt0RbeB45YL1Qbe9l2ZvHtwDdM6v37dcSesA8HNOPHB9gieRUi_RkcaE3gjO4xyT59b4sj_HRH6s4rDv7gGbM=@proton.me>
In-Reply-To: <aqG3NyxZE-Sj63vb@stanley.mountain>
References: <cfUNtu1Qjzp-pieopsMQtanXUJTuVi9kZQ14w2f_jp55EwWn7Pnu5EwFUNI2vAWw1vWe3jD7Mz4IK6t1iZLQLE1fEnjfYfQdBV8tZF6Q4aM=@proton.me> <aqG3NyxZE-Sj63vb@stanley.mountain>
Feedback-ID: 147676893:user:proton
X-Pm-Message-ID: 8c89ad55daf4caf738dcff7fe559f7d33bb35af4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Thanks for the detailed review.

- Fixed the From header so it matches the Signed-off-by.
- Dropped the review-style commentary from the commit message.
- Switched every site to sizeof(buffer->data) instead of PAGE_SIZE
  (I'd only done this in one of the four spots in v1 - fixed the
  other three too).
- You're right that none of these can actually overflow today:
  capabilities tops out around 3 bytes per input byte on a payload
  that's at most ~1KB, nstreams is on the order of 4, and req_id is
  just a u32 printed as a string. So no Fixes tag, and I reworded
  the commit message so it doesn't reference any current or
  hypothetical overflow - it's a plain style/robustness change now.

v2 below.

Thanks,
Vaibhav

---

From: Vaibhav Agarwal <contectforbusiness@proton.me>
Subject: [PATCH v2] staging: greybus: camera: use scnprintf() for debugfs b=
uffers

The debugfs buffers in gb_camera are written with sprintf(). Use
scnprintf() with sizeof(buffer->data) instead, which is the usual
kernel pattern for writing into a fixed-size buffer and makes the
code easier to audit.

No functional change.

Signed-off-by: Vaibhav Agarwal <contectforbusiness@proton.me>
---
Changes in v2:
- Fix From header to match Signed-off-by
- Drop review-thread commentary from the commit message
- Use sizeof(buffer->data) instead of PAGE_SIZE at all four sites
  (v1 only did this at one of the four)
- Reword commit message to not reference any overflow, current or
  hypothetical - none of the three call sites can overflow today

 drivers/staging/greybus/camera.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/cam=
era.c
index 62b55bb28..0e9d7642a 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -890,7 +890,8 @@ static ssize_t gb_camera_debugfs_capabilities(struct gb=
_camera *gcam,
 =09for (i =3D 0; i < size; i +=3D 16) {
 =09=09unsigned int nbytes =3D min_t(unsigned int, size - i, 16);
=20
-=09=09buffer->length +=3D sprintf(buffer->data + buffer->length,
+=09=09buffer->length +=3D scnprintf(buffer->data + buffer->length,
+=09=09=09=09  sizeof(buffer->data) - buffer->length,
 =09=09=09=09=09  "%*ph\n", nbytes, caps + i);
 =09}
=20
@@ -973,12 +974,13 @@ static ssize_t gb_camera_debugfs_configure_streams(st=
ruct gb_camera *gcam,
 =09if (ret < 0)
 =09=09goto done;
=20
-=09buffer->length =3D sprintf(buffer->data, "%u;%u;", nstreams, flags);
+=09buffer->length =3D scnprintf(buffer->data, sizeof(buffer->data), "%u;%u=
;", nstreams, flags);
=20
 =09for (i =3D 0; i < nstreams; ++i) {
 =09=09struct gb_camera_stream_config *stream =3D &streams[i];
=20
-=09=09buffer->length +=3D sprintf(buffer->data + buffer->length,
+=09=09buffer->length +=3D scnprintf(buffer->data + buffer->length,
+=09=09=09=09  sizeof(buffer->data) - buffer->length,
 =09=09=09=09=09  "%u;%u;%u;%u;%u;%u;%u;",
 =09=09=09=09=09  stream->width, stream->height,
 =09=09=09=09=09  stream->format, stream->vc,
@@ -1046,7 +1048,7 @@ static ssize_t gb_camera_debugfs_flush(struct gb_came=
ra *gcam,
 =09if (ret < 0)
 =09=09return ret;
=20
-=09buffer->length =3D sprintf(buffer->data, "%u", req_id);
+=09buffer->length =3D scnprintf(buffer->data, sizeof(buffer->data), "%u", =
req_id);
=20
 =09return len;
 }
