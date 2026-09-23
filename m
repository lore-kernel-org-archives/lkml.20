Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CFD4582D5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149361; cv=pass; b=dna0k1ZhPPJokwQWgaWK4Ok24grI5Pu1BSOzFP684hwDal7ZrBtB/kSfnAdZWLm0OXnGSGw2dJllj4I+2fPCgLzgczP2d9MN8nQ0x/WJ1amb08si44a10xH8kHUJgP0Pp3tKxIXbTFdWRstEoXPkVIiWxuC4OpA8xAuUiUVNdps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149361; c=relaxed/simple;
	bh=/IJk6BwyL2t+xmXjHGLGD+TklywKkZlMfXsjfutBVv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C1xZsNrlioZtfW84onyb2CbjlhTj6tx8gcNVRKkiF0ZE3mO74ewQZ58Bslo4ygyhqrq4VQauTaKepaVQYAZB9qM3eAhy2sFCIOIPFIOn5WvqhFUrdE4R3FM+UMiEwfDV4prDUVUt+7X7AihcVurxErb1DJ4sKsWNg/L1savTGtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PBuvzwOM; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PBuvzwOM"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so495318f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:42:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790149357; cv=none;
        d=google.com; s=arc-20260327;
        b=IncGXya1vrhY+V7CMycve657BjyRXMojVEVytKSbzFlojDuSGcJNQrnlCheNrGasQH
         0DAZicyMvLtk6t10ZcdRtaLBnM3giRNABp6bgxefp8e0hMXnp/h/SWh0SJfx8LdcFztp
         8KM0AlXbfeRGmgmpnEjlT5oW7Fx96H+Q9KDNKN++55NaOtHPs+6H8RRgPOc60eY+lY2v
         POaWPwe2Au1HMSbPebZcSdX+vIvuAFhwLBF+2T488l5w4T5dPG0yfO1TR7qsM9vpSbqZ
         mZ3Dsp+ZU7DxnE8mKxV0H6GyXCW3H/cOZCggrqepjeFvF+PpbROFtb/KnFnaMdkRDT3C
         KQ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/IJk6BwyL2t+xmXjHGLGD+TklywKkZlMfXsjfutBVv8=;
        fh=eRIVqTYkO1j5fNJJX8t6K8UqCw77QnyVhWC4DumtVOA=;
        b=GGA24VZqxn2DiWradREcP/5P8L89k6jPDP983I6O+E3XqQni9IlprSF2BdgAHAoKTi
         9jjkoE646nE8y/Idh9AoF+Y7ZNLXcwnAZTMl+Hm7K8DAyKn89PqmZ6UP389gsvXDp3vL
         5twlpxcBmwgWsjm4OqSAoYu6hbaV7iSk+sBl5Q652N47elKwEds72PANXxs8LkPhGjCn
         4HPFyZRa+L1Mixm4ZRU4NTMulKSaPIbSRlVxKT/JWfQv9uUnHK/7MQRpFB2Chp76SJHe
         XiI25NIPxrEGagYFHhzTZN7Q54vk2R4rGc/PIzGTnhyYAhdFdrgOP9KeEJFQ+kgnruxA
         02BA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790149357; x=1790754157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/IJk6BwyL2t+xmXjHGLGD+TklywKkZlMfXsjfutBVv8=;
        b=PBuvzwOMlJE50DdNANx8SQ7X61G/v19IosMrQmMsLNtLvBx38548fP55e4IgXLwiaz
         7hU9k3SwTJ/Bm/S+B5PLB8vaNWlAxQ9d46eLbhyQDhrwcZQD4RYIKXmgKu4NEmCCc1Ce
         H+wVO5HRuy/PZLRKNLnyqMotJvdsS92S1c9oEWDn4XX0pQN/bX2OeVmlFZ5hi7U1RFup
         iW7uwvRxa+SLDA4e4GogGxl4oHeBpfYaMES3D/A5EGEY8GrScQcaE3A+Cd9hOrvPBxAz
         Dq5v1M7BrmYkDgDvwsHYUX55vjYU8YpfG0rHFWJw73oGIIVdzwVbuTCujP4XEC3u/PSN
         tNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149357; x=1790754157;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/IJk6BwyL2t+xmXjHGLGD+TklywKkZlMfXsjfutBVv8=;
        b=qKxzFcFuh1nEZmqMkZ7c518DLarbqOefy7ChXqePq1aUbAiniDW7EnnQQXbsFnDSPI
         AxVJMi49DFz3vCBtsRTuQwTz5c8ZEpNY5x8ocMaW8PAjP9KibYMvztIQoPm/ktpzEnxq
         v2y34SykzwJM3RnHdiYiwtLy7DjryDhGQ5fO8XsQf7nxZ9sCmHRDU31BVM4obYCr4obV
         Fik6YpDqrPRnTkZ1w34wA7cSkjIepDZ6klGWJ10SfSg6VG37U7RDciLJaxPlPktjD3tP
         /tz1xJL1TWcbm3DK6OiM5dbfxsj+yk8jLD77snQqBE4eGgm8SehVfxoV+LDB2318PTW8
         60+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxEMB2xVSrriDIGwQyBiHTMe8rda9tCglOjdMqMyehymoEqb/IOYGNrNXgh/fCJPiOpzVeg0Xo46Pq7vhU=@vger.kernel.org
X-Gm-Message-State: AFuF++m7l87Vys1tjQTZgcOwTUCO0CoWFkl5xaToviNnqzM0+s823f17
	UiZS6+zv3ID7Y+aIRIxozeRZyso7IS+UGeSUaDXCGr6FUSr+75oennp1rpTnvuiqcR/75ClnomD
	X6rdR4E8g1dOxjG4c8s//Tg0aud3DNK8roV8fqf19
X-Gm-Gg: AYBFou3cd0iqAOcA8GZ3up+KlOZLMJ1aGbRMZnJveAuR/mrLU0uaKqSqVXuDvz/OaTY
	O+TZTa/OiSBgf9nlCZ7sWiv2/evN1vy9dv5VNLoG1O/887iDveFWDR6AoOW4vYRYrSFdTG6TAn8
	VYpXYb+cAQU1RTtCmNqNklLILB03QVFHAUFTx/TfuW0FakeZmUMJ9yWy4nIqxj23465FLruUrNd
	lBL0GSkqbo1V6YwTAovie77fESr2oaWI3T0iFaOk46ei7JxYTqenkXmbro/5aXAMDTvox+retJB
	RAUNsBPIaS3cFfl1Lw/g2rQVEEJZ+d6Nr2ZnTUlZAxqRZQpRsfY+Rq5W7F2OS7M01YTuUdIPcK9
	9d/rAm4XHcVpxY0wm9H6wuih/D2nrdHk=
X-Received: by 2002:a05:6000:178b:b0:486:f1ec:f939 with SMTP id
 ffacd0b85a97d-488670a6c46mr3157053f8f.40.1790149356616; Wed, 23 Sep 2026
 00:42:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-b4-gpu_info_zero-v1-1-7259840069c6@collabora.com>
In-Reply-To: <20260922-b4-gpu_info_zero-v1-1-7259840069c6@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 23 Sep 2026 09:42:23 +0200
X-Gm-Features: AclHuK_kOTENlrajsbD3PM-8sSHORN3Gp4PV1SmVXbX3HMVeZKOfsOHmtEYRT3c
Message-ID: <CAH5fLghN0w908Z-MYDfmaeC7gvAB78MMT7zg599=1kU0HexkOw@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: gpu_info: zero out new/unused fields
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
	Gary Guo <gary@garyguo.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	karunika.choo@arm.com, boris.brezillon@collabora.com, laura.nao@collabora.com, 
	steven.price@arm.com, liviu.dudau@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 1:16=E2=80=AFAM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> If a new field is added to the struct drm_panthor_gpu_info in the panthor
> uapi, Tyr must initialize this field or it will cause a compile error.
>
> To pre-emptively avoid compile errors, use ..pin_init::zeroed() to zero
> out all new fields added to this struct. Tyr can subsequently change the
> initialization as necessary. Also use it instead of manually zeroing out
> existing fields at the end of the struct.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Merged into drm-rust-next, thanks!

With regards to sashiko bot, we should look into whether the
MaybeZeroable that bindgen adds to structs applies on this struct. If
so, we can remove our unsafe impl block. But it's not an issue in this
patch.

Alice
