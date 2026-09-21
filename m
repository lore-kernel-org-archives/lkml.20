Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388254A5EAF
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003715; cv=pass; b=Hnygvk6U+Gef5ASz/ZuolCs6dfT1R2Nnve61df5KdtoPNea16J5o0ahYTlxgKL9xRBvUdPccZBTsMusvHEjqKh13ryIRDJnmDHIhdbPihO8kCDZRvqpjCtGBC3H4wFY/5RSoaciojWuRqLUYqvVbJPGZX2A/1nDjBf30HalXuj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003715; c=relaxed/simple;
	bh=E1DA6eJVvIMFAljzS7SN9tcSVSmcyDpJjIEWFM1xV2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ml5TZhHx3+0Vgd0Q3gZ6V1X2xPSIk+u9MNLJIPAEbhhiQ5v3YEaxeusW1ele27YSo+769bSBE1MR2QBHM55EzqX/WvcPxr/5MFo54OvkXmvhwdyPZpWV7+geRACjO9nMUCR9cMMTUQX941VVy2/Ath57NCW/t01b6WGvkJuVw9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYcejnEZ; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYcejnEZ"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97cb5cb0af4so71362241.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:15:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790003713; cv=none;
        d=google.com; s=arc-20260327;
        b=bVI3JLfpkYD6WSCpaKwMARXWg6pZAtGwH/2oSpNJ6P7SugDiqIWfF4NkZWSUjkrKAp
         Iq9batXqtClghuV3u8b3uDi44AlTaow2AdX5Y6ggDVUa3+fj48DKxdujJsCfjkqHlrVH
         CGvjg4mzjVY1/ecR98qgK3sz8dUZmlLp++retyYVUKCoo9jv4eFJgrr+4NeOGT0gpHZf
         adxDnbo+V0TuAjoQeNZ6zM3cH8mNhK1LKY1mQCpN941G3UAhqjWH5ophPSp6UevZR7ea
         lXCZl9R0goep/T18BH+stc7wDLANFBSyeu/eCBunHCL5mWuW2MFGu0IOST1Hu+lLPfnw
         53vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z6taRN1yfrJhXingP4b7nQEv0S92qILvbAb+oYWwjHI=;
        fh=NoJla7ShuTwnvfoK1HapEoiydgOIjwLxM+lqmoHrzXY=;
        b=YKITkfMOXDDGpc5dnr+sn5Ex4DCs+Lwjvfaok+d4LLKTYZ/ZuT2Qdh4f1+EyHhWVqL
         KNN+PRf6ckkHIp3tVsLjV/+uSzPLzALIOKj7ktYglyc10r9KxeoCRs7BIQkOs5fRCmjM
         WtCAI9jfK+XFzDKdgi9W4xn3L+M47KrtIZLrGsqi68bSRViHlTeSPkdzWI6a4Sc2MOB+
         2DyykA+r7jgqi/FN0SlKHIYm3752Rx5BT1q+DpmeNgxT+v6U5WMcUxa7U6TVc39cuuXs
         P0AbWjeNbJU5S3yejMRyRowuTjiabiYXiitwPZ5GlaY4DUs76A7COegBbW4IP9jzk1Cg
         xyFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003713; x=1790608513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z6taRN1yfrJhXingP4b7nQEv0S92qILvbAb+oYWwjHI=;
        b=YYcejnEZUgXmxS+DBiRdXO4VYJ3EkCmVURstwalAAXBeZyJcM53rKczeAGMIpyfnbE
         lTZHz/YTf+kwkyuZ3lPn40CRhta35f1qzui/vUpObOnDKtNwJ2PBrHoxoavPvm2XaR17
         pKGwpY44RO8uPDhkrOGkZ/28cPUegfJ5HQMqaKzA74G7Ze7sTRE3brsBgRgv5h8K7heq
         Xwqiva/zVcyMZ8lDRpoYzwnr+99BS8CSZ/jDlTev+N7FVRBxaAFOTvsXzDEzRyFDkgiF
         s7Djc5Gnd0xNDxiBkSO1MBJ0EArkcqMCU5PPeMZLL4B2P8NebjRm3o7FW9eU3eahZRvu
         mYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003713; x=1790608513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z6taRN1yfrJhXingP4b7nQEv0S92qILvbAb+oYWwjHI=;
        b=lCIm/lGzkGhmbQO2ghIOJ0uRjfO0pwPBsouaT9Y8vTz6TTOzqbpkN3pmqAgvVR64Tx
         j+FRPtfCeSYQEKfqBw3fMtYZbb9kwZx1o2qsz40sXZ7GgbkHCaehpIpUgJvt5+VmtJge
         ufdgc762sMEz/O7905Hy+f/71IOZsOZjbQaHubqHdqeaAf3myz3Bc8LIoCsznrEooqmE
         tjlKl3Y3kvw7Z6remcevVm9eMKWDLcpAtS6JKl4Z9bNWz0vKH9YPvU+sVGeMGtWDWQND
         RTZMfoA9dI4GkTiaeB+CR9C+CzuvrjBJP7KEb4VDt6pnZCfe2qs5imL8ckr+2W5y8zwr
         m1vA==
X-Forwarded-Encrypted: i=1; AKwUvBy6LrSnse4oJ57Q8Dn3VwqlY9RUe2KmTFiJ/rCdSN9X1yr1wWRZbuAiw0hzQ2qWi5oJSWDwf9C9xMZzp+M=@vger.kernel.org
X-Gm-Message-State: AFuF++lzZ/huNe0SJdkKvhmlZj224hYwkxd3JiwjJ3QyuaMUCUCj4TKy
	3mslrLA2TEOlELm/TXPVMaapPPz+KB75GyClKfNBJpc+NAuBKdQbgPDIi2Yp5Lz1QG6w39XmUar
	it5g5qFWU6pQ1KxgTSkmrV8+MnkHeu9M=
X-Gm-Gg: AYBFou0tPYUKuMQStQwckjUCf2W+P0OPw43e0JDh9ZTI3SaNrK7sn960SGp4hJnIdYm
	hB1IY5V7H8KX+VheXGNtF1icEjAoYkcmiWDXSCA/rlDtriRowk3etFBm9sijovPc8RpUywjDujf
	mBTwXzcFW4o2w1NUFsULundtBJWhvvJjEbxXOAhB4h8abttip5nBtoiOiovGaix11JyCasetLUT
	yX8XgIpC2qve3OLZP6s+hK7sCjeMXmlAj4A/sVa7Xdf8YvGg0mavBZ5Zlu7FBu385JJTnB1fljw
	4Ty/+lttGoXA8QtInB17W16+P6w5pPt+v1oAwb4L11hGmYO3+hWQaAG72w==
X-Received: by 2002:ac5:c802:0:b0:5c9:937a:4670 with SMTP id
 71dfb90a1353d-5c9b89cddc0mr4130358e0c.1.1790003712920; Mon, 21 Sep 2026
 08:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804181951.5206-1-saileshnandanavanam@gmail.com>
In-Reply-To: <20260804181951.5206-1-saileshnandanavanam@gmail.com>
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Date: Mon, 21 Sep 2026 20:45:01 +0530
X-Gm-Features: AcwNN1UK3NxgU8L7a7p0OqKo7KlHJ1rZX_wdea6dW2DleRXUVx778GaLAT1KLDM
Message-ID: <CAF+TLO1woWAd2WFKBV5T67OsmnV-7JbzAPyotRUz8azyn4+8Rg@mail.gmail.com>
Subject: Re: [PATCH v4] remoteproc: qcom_q6v5_pas: Fix dtb firmware lifecycle
 and leak
To: andersson@kernel.org, mathieu.poirier@linaro.org, 
	mukesh.ojha@oss.qualcomm.com
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mukesh, Bjorn, Mathieu,

Gentle ping on this v4. It moves the DTB firmware request/release
into qcom_pas_start() as Mukesh suggested on v1, so the reference is
released on every failure path after the request, including a failure
in qcom_q6v5_prepare(), and on the success path.

It still applies cleanly on next-20260918 and builds for arm64.
Mukesh, could you take another look and let me know if this now
matches what you had in mind?

Thanks,
Sailesh


On Tue, Aug 4, 2026 at 11:50=E2=80=AFPM Sailesh Nandanavanam
<saileshnandanavanam@gmail.com> wrote:
>
> DTB co-firmware was previously requested and loaded in
> qcom_pas_load(), but its lifetime did not match the actual
> start/stop lifecycle of the remoteproc. As a result, the firmware
> reference could be retained across restart cycles, leading to a
> leak for each successful boot.
>
> Additionally, if qcom_pas_start() failed after loading the DTB
> firmware, the remoteproc core would not invoke .stop(), leaving
> no opportunity to release the associated firmware reference.
>
> Fix this by moving DTB firmware request and loading into
> qcom_pas_start(), so that its lifetime is strictly tied to the
> remoteproc start sequence.
>
> Update qcom_pas_start() to ensure proper cleanup on all paths:
> - release PAS metadata on failure
> - release DTB firmware on both success and failure paths
> - unmap DTB carveout where applicable
>
> Remove DTB firmware handling from qcom_pas_load(), as it does not
> match the correct ownership and lifecycle model.
>
> With this change, request_firmware() and release_firmware() are
> properly paired within the start path, avoiding leaks and ensuring
> consistent behavior across restart and failure scenarios.
>
> Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-f=
irmware loading")
> Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
> ---
> v4:
> - Rebase onto linux-next
> - Remove unused int ret from qcom_pas_load()
>
> v3:
> - Remove the unused release_dtb_firmware label
> - Release DTB firmware under the existing dtb_pas_id check
>
> v2:
> - Move DTB firmware request/load from qcom_pas_load() to qcom_pas_start()
> - Fix firmware reference leak across restart cycles
> - Handle start() failure paths where .stop() is not invoked
> - Ensure firmware is released on all success and failure paths
> - Remove DTB handling from load() and drop release from stop()
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 47 +++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index ca8e61254c44..864446a484f1 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -231,7 +231,6 @@ static int qcom_pas_unprepare(struct rproc *rproc)
>  static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>  {
>         struct qcom_pas *pas =3D rproc->priv;
> -       int ret;
>
>         /* Store firmware handle to be used in qcom_pas_start() */
>         pas->firmware =3D fw;
> @@ -241,23 +240,6 @@ static int qcom_pas_load(struct rproc *rproc, const =
struct firmware *fw)
>         if (pas->lite_dtb_pas_id)
>                 qcom_pas_shutdown(pas->lite_dtb_pas_id);
>
> -       if (pas->dtb_pas_id) {
> -               ret =3D request_firmware(&pas->dtb_firmware, pas->dtb_fir=
mware_name, pas->dev);
> -               if (ret) {
> -                       dev_err(pas->dev, "request_firmware failed for %s=
: %d\n",
> -                               pas->dtb_firmware_name, ret);
> -                       return ret;
> -               }
> -
> -               ret =3D qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firm=
ware,
> -                                       pas->dtb_firmware_name, &pas->dtb=
_mem_reloc);
> -               if (ret) {
> -                       qcom_pas_metadata_release(pas->dtb_pas_ctx);
> -                       release_firmware(pas->dtb_firmware);
> -                       return ret;
> -               }
> -       }
> -
>         return 0;
>  }
>
> @@ -282,9 +264,23 @@ static int qcom_pas_start(struct rproc *rproc)
>         struct qcom_pas *pas =3D rproc->priv;
>         int ret;
>
> +       if (pas->dtb_pas_id) {
> +               ret =3D request_firmware(&pas->dtb_firmware, pas->dtb_fir=
mware_name, pas->dev);
> +               if (ret) {
> +                       dev_err(pas->dev, "request_firmware failed for %s=
: %d\n",
> +                               pas->dtb_firmware_name, ret);
> +                       return ret;
> +               }
> +
> +               ret =3D qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firm=
ware,
> +                               pas->dtb_firmware_name, &pas->dtb_mem_rel=
oc);
> +               if (ret)
> +                       goto release_dtb_metadata;
> +       }
> +
>         ret =3D qcom_q6v5_prepare(&pas->q6v5);
>         if (ret)
> -               return ret;
> +               goto release_dtb_metadata;
>
>         ret =3D qcom_pas_pds_enable(pas, pas->proxy_pds, pas->proxy_pd_co=
unt);
>         if (ret < 0)
> @@ -352,6 +348,11 @@ static int qcom_pas_start(struct rproc *rproc)
>         if (pas->dtb_pas_id)
>                 qcom_pas_metadata_release(pas->dtb_pas_ctx);
>
> +       if (pas->dtb_pas_id) {
> +               release_firmware(pas->dtb_firmware);
> +               pas->dtb_firmware =3D NULL;
> +       }
> +
>         /* firmware is used to pass reference from qcom_pas_start(), drop=
 it now */
>         pas->firmware =3D NULL;
>
> @@ -361,8 +362,6 @@ static int qcom_pas_start(struct rproc *rproc)
>         qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>  release_pas_metadata:
>         qcom_pas_metadata_release(pas->pas_ctx);
> -       if (pas->dtb_pas_id)
> -               qcom_pas_metadata_release(pas->dtb_pas_ctx);
>
>  unmap_dtb_carveout:
>         if (pas->dtb_pas_id)
> @@ -381,6 +380,12 @@ static int qcom_pas_start(struct rproc *rproc)
>         qcom_pas_pds_disable(pas, pas->proxy_pds, pas->proxy_pd_count);
>  disable_irqs:
>         qcom_q6v5_unprepare(&pas->q6v5);
> +release_dtb_metadata:
> +       if (pas->dtb_pas_id) {
> +               qcom_pas_metadata_release(pas->dtb_pas_ctx);
> +               release_firmware(pas->dtb_firmware);
> +               pas->dtb_firmware =3D NULL;
> +       }
>
>         /* firmware is used to pass reference from qcom_pas_start(), drop=
 it now */
>         pas->firmware =3D NULL;
> --
> 2.34.1
>
