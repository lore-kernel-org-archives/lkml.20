Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794417637;
	b=rXfCfqQ7m9rKgJhJCyeJixMNkAJmlyHXtbwa24b8hrCdmsUSYlW3IbhysDc1prFeVF09
	 q4QT6/sL62zQY67OuacEl75ZPr0IWWi7cNaSN4E8q41ELtlx3o79MI4WpO+wPVqG9KXYk
	 emYWraa4wGHDUe2XrjDJXe/w/Adbvqi5gy2Vm5c3r3+z/zbOayt7W2v7gAx0bgrHbgQhy
	 J0lxCtWcZdCryye9uuRdLVbQHyySuI2fS7ZeL3MQ5kDNSjsA7DpE/zt7JWf3wBDuf/TO0
	 slzfubT7G2z3ugBI29jpPqxhL+bgvMkD4d4AfCpOmNTtcCXBvq0mpJ/TdHwp2toSzpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pxB40q79An19C6sh7p3I+5Mbwo7e0V/V+8imyCMYB8o=;
	b=hQJPJzAQpmg+e7KnTRnRvPrfCkWxyzmIOD7phNDq9D5l6SE+Nv3AtuW3KqP8ypJ/Y6A0
	 /6XADS4iHlN4wqdegJnBjJFq5vrgq2P1JUqal9Rg2sOFdLIGFP5hi5xJzQn/vWWmIOBVd
	 RtbYFE/sKmBq5ml1RNFK1rlOMTnClPFmtb8hjpJMoQGbKATY4RD/uPDY6acYkRBGAwYcV
	 p4+icYtH+Mwe2qE3POcdlJ6BwqSeMbOQbaryuiuYYGY5dkvs35WmD6G+3S8ZI7Ao09C8x
	 c1GbQeDdvPFnIt8iCwHl2MpPFqn1NLpcBF8nVRzq3Mo3jPD/C6eICd73SX7jm+5qUBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jZs5JaPv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942C4606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 942C4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jZs5JaPv
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35159e0092aso78913eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:20:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794417637; cv=none;
        d=google.com; s=arc-20260327;
        b=g1eBfgebWglZS2/USe5+Q4ByGPIyG5D3y4CcmEUFengmuKS23xe8mjMybFThp94STP
         VTAbAxX5riGmjKhrFNX8OGdsGJ/Fukwt7pYhAQGOEmAwYsqKzPjSv3KGNWXOqt/NRCzC
         6T8+bDvuTC2/tXCKnG8RHLKagAtDGIDrUYOWTWUNVRL0ZSOaa4SxEA4s7EDj9NTacL/4
         bS8cVJoiJ5PXHWDyjVp8dQ5Rx5syGPzpoVL/ltWMq9al3j6YLDieGrzvZjjCg+w+Bnmm
         sZhSo3Ea8OBBWz1RuvnC3oMoSk7qn88PopmJgZEdgUTais6ygKeFdLSC+bIQXeA3HbzH
         kyxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pxB40q79An19C6sh7p3I+5Mbwo7e0V/V+8imyCMYB8o=;
        fh=vyfAvNcQZigvx4AMqmSOsZaEMlfvL9I/K74MBXhZ+HI=;
        b=QcDUG4ZtVBzx+yDocM29ZdDEfbNBmKsIRHREm6XFqyAdes3UXZKEYHdULH/7XJMviW
         G9Rhx/2GpwVtPCdFu2w4vGTHXDom/0IpYdZq8H+5qU87b6TsVIjAk6B0g23DnhhuIOnn
         AoXpzDwYYquiXr1QkyFQpr4rPfeJ1fdslJbRmtO6819ah2WmC7tPgu1y1NmXy2B4pXBN
         /qW8Wm3n34EEKHbmbpD0h6vGGxo6FoczZjGsyOH0ugymi4bjwgCQkQREKYaWRnZjUOJ/
         QzNG0QupxWSgmvupbJmAFxvLnH3t6/Wv3+rN1QQtg3r8XJu18INY2rzIAQ/ZPVSw9Zle
         Ding==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794417637; x=1795022437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pxB40q79An19C6sh7p3I+5Mbwo7e0V/V+8imyCMYB8o=;
        b=jZs5JaPvzzKoZT+pGwPsj8NQZaL3pQgSbYOZ8exWg5qnih8fyGqgrW5l9R9+IsihNj
         Rb0/ksUvUNLYihQzs1iQ6sGZpzFM2lvLyprPiSMFitn1q1K2A7mfgDJXOHJLDS4UyH/7
         xyjaHFe4icHqyEDMQ67x2Vjr7w1Q8dYSmNZ0SXPh7hhCHPHUON+813htLOXDhOdzJxjv
         9ungVpu3YRplhcElctCUML91SJCTECdOru9cs11fk0hPZn3mhtRvg3wVDVL1uMq0H+gh
         DdJeAlfIm+4DLR0S3qrOvuAvfPZG9jKIb59h1HVJgGhIVT3V+GMTwKaOoz4f6TRj3nJu
         gZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794417637; x=1795022437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxB40q79An19C6sh7p3I+5Mbwo7e0V/V+8imyCMYB8o=;
        b=2mi5OGfVT8ZFUEGCMfNg2bLLx5kWNU8nxJUipLcstt1AYyxi1ZTv1rz4QZdI8n8xqL
         GrnsaVlNPc5KwB6XasXe4qIqPzboK1TmHtm5jKvqgXVSAGaTER+kz7rOKa0796APU1AI
         JictVMAxn1umkhChOGiwUoL+WDFOmg+kwcmYRxAoXM6qBe9zasGtTyqgINjJnd6Xl+C8
         eqdBicfPv988d1kEjshJ+RXs1C1Cjm3m3WamQvRQCJLectxRmC0mvjTsJf5rGwDeRiZc
         ZM6wCaLYrMVLW/NuhgPBJ1TaliCBfDes67ePc9aDSt6Nds0PdBluz8B3CumSFA7dQY5x
         MAwg==
X-Forwarded-Encrypted: i=1; AL+hErEdh5ziTEmZduV8yxXOikgy8yo/xIoZas+T6Su24CD0Nh8ebvhZdFEX/xRuVJGnOOxRWUuFwdqbtLMYRFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xgWFqcdRFJyW+pMGkRXyuTHfDhS2f49NPVZ3r8XfDxYGaBf1u
	YuWeoAw9BDcUFcE4Xyr4IOu5T1S+d4eetIHwCghDr6zS9+JztyJE99WcjRmZLqOAsX51KEHhefQ
	gzkbbPlYo4aySvOetDqsCWczgpeDnp3s=
X-Gm-Gg: AYBFou0wCYC0pOdK4q6Qrz0yKJ/f8Spc30OYcT9ZszxsowmObdR70eFAw0TSt7HAe+5
	KlL62pcWtIzu2XcKklzDLn+/6/r+0uXDOG3LcnlnG6YXnZ7GZdw2icY2fB5VwWV8R/9BVbCxQDE
	9gIS0yd9a3Ok44RdN80j+gi/xG1uGRiPUJrgJ66JHjJ70We9fepbYoMU4Kc/1L2ahthOKR5cBT6
	IBeopMaPBxaQBVaxB1eclg1vumFYp4WT6QqPjTIpZGqQQdXJNEHwrv0E+QesBtwS+heSleOOvoy
	kD38ardRA53rxa91aZRrss1kydkV8VEyYBhGh7FJIpjA2e0cf3E3lX4eVZk109Ogvfzn/le5t9P
	HdPIJLBlDMlLTJma53tZLld5ome517/UbDnnZdIUULYYfCp2xYZy+UGwW7VtQEhjyoBMUHM4TRd
	VLcGZ5/wSjiD7yoKFUmhzLsB7sHqLc+TfEs0bI2eT3pFh21tzKuWHHmiciPCM=
X-Received: by 2002:a05:701b:450c:20b0:17f:641e:7f6b with SMTP id
 a92af1059eb24-1b3c02cf135mr4365930c88.1.1794417636541; Wed, 11 Nov 2026
 09:20:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110160429.892673-1-colin.i.king@gmail.com>
In-Reply-To: <20261110160429.892673-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 11 Nov 2026 12:20:24 -0500
X-Gm-Features: AclHuK96pzFNcsCpriytYsF_JfHFuBx3rYaQSacUjjgQ682B45jmkk_N34BB_lU
Message-ID: <CADnq5_OWtqzN9VDK7F6F_FBy9XkDmk_1jAMR6bivEsJABe1rag@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu: make the read-only const array
 fw_err_code_msg static
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Felix Kuehling <felix.kuehling@amd.com>, Mukul Joshi <mukul.joshi@amd.com>, 
	Philip Yang <Philip.Yang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed and applied.  Thanks!

On Tue, Nov 10, 2026 at 11:31=E2=80=AFAM Colin Ian King <colin.i.king@gmail=
.com> wrote:
>
> Don't populate the read-only const array fw_err_code_msg on the stack
> at run time, instead make it static
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ualink.c
> index d025b4183b29..91c863649972 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
> @@ -5427,7 +5427,7 @@ static int amdgpu_ualink_metadata_init(struct amdgp=
u_device *adev)
>   */
>  static void amdgpu_ualink_remote_error(struct amdgpu_device *adev, u32 s=
tatus)
>  {
> -       const char *fw_err_code_msg[] =3D {
> +       static const char * const fw_err_code_msg[] =3D {
>                 "Unknown FW error status",
>                 "FIFO overflow",                /* error code 1 */
>                 "Invalid RB command",
> --
> 2.55.0
>
