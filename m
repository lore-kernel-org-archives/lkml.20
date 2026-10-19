Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053EC4DF4D5;
	Mon, 19 Oct 2026 11:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410535; cv=none; b=ZbafpWAv1QsS7Ue6ofnO/Oa8E8bQ3DhillBNIq6Q5AeOSfHcQfLtj9FannQ7hMeMMcEenO+beKrIofJYYH8xL0qMS3hstezQUPcc/Q5TosHvsAY66S3AMh2dSLNEvVHWyrKbURauOv5LQeP6DFMAoq5n+yzixfyYv2mBVPF1uvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410535; c=relaxed/simple;
	bh=pKSArXpk/5IJh+/fKSThGW+GIdbiteG9/vEycrk2pds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GwXVIlbkh1XzpGDWVo73iIK21Uu1rHxYZbnFNEW+VGJ912/wsWc6UJ9HAT+xxyNJMdOwwXaSIk7UsXztOLovNtXtkF5K3jKsXlMm3xDL2Zww6zIPnCyNXgrMAkpJLykcLTNUXA3gLEczJ8lu9o/4Kjzu6b0BHWxivMBY47q8Dcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXrfQasl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXrfQasl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37841F000C5;
	Mon, 19 Oct 2026 11:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792410533;
	bh=5bVoZnEarRBs9Xk5wqya8DrG3A1bPmlIgxOyF2pbG3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IXrfQaslscILGXoY7dMfLmeJ3rKloCn5sPs9jso2bKegmGYtIIOe7BgHYEPtIdYWL
	 5g3jaVRY1Fdsmot/Xix5bb8Ly1rXPcn+7RX0W+DwPDRGFJ+BPIRLS+3ArjRa5dEfgD
	 WdoImdUbHvqe+7wOoYLqTdEUixfOFJleozd+591RWzmRkpuMZOkgWSvKeIXh/jchC1
	 175kH3lfxu08NTv3x178CilXX1fo7wScY04iY+pPyxYrG60KuMSaXeSkC6Czwkb0I8
	 tfD5BY8dEIq58KmmPN/VWjY7S3REBjKxHMxcl0vvM8lz8yLm5kF1tay7R9l8JJgdOj
	 c88/1pZSqSsew==
Date: Mon, 19 Oct 2026 17:18:49 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tee: optee: allocate a bitmap for all valid notification
 keys
Message-ID: <atYDodGDc3z6Qv4f@sumit-xelite>
References: <20261009-fix-tee-max-keys-v1-1-1462d96bf438@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261009-fix-tee-max-keys-v1-1-1462d96bf438@oss.qualcomm.com>

On Fri, 09 Oct 2026 at 20:19:48 -0700, Amirreza Zarrabi wrote:
>Notification keys are checked against an inclusive maximum, but
>optee_notif_init() passes that maximum to bitmap_zalloc() as the number of
>bits. The bitmap is therefore one bit short. When the maximum key is a
>multiple of BITS_PER_LONG, accessing that key reads or writes beyond the
>allocated bitmap. Word rounding masks the problem.
>
>Allocate max_key + 1 bits so that the highest valid key has storage.
>
>Fixes: 787c80cc7b22 ("optee: separate notification functions")
>Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>---
> drivers/tee/optee/notif.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

>
>diff --git a/drivers/tee/optee/notif.c b/drivers/tee/optee/notif.c
>index 68014222d7be..2bf5ce397233 100644
>--- a/drivers/tee/optee/notif.c
>+++ b/drivers/tee/optee/notif.c
>@@ -114,7 +114,7 @@ int optee_notif_init(struct optee *optee, u_int max_key)
> {
> 	spin_lock_init(&optee->notif.lock);
> 	INIT_LIST_HEAD(&optee->notif.db);
>-	optee->notif.bitmap = bitmap_zalloc(max_key, GFP_KERNEL);
>+	optee->notif.bitmap = bitmap_zalloc(max_key + 1, GFP_KERNEL);
> 	if (!optee->notif.bitmap)
> 		return -ENOMEM;
>
>
>---
>base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
>change-id: 20261009-fix-tee-max-keys-50f2db87b4e5
>
>Best regards,
>-- 
>Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>
