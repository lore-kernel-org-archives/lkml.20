Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630B7559CB2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957651; cv=pass; b=U4xMZ0OSKqkdqWGLhAPROukjKXAbVcskdfnvprpseoTi3oPHyDFmOhExF+2Zb2Djj+2OSxlVVzA379mCmVcznw4cw0He+U3+pBnjRF+qY7UAvWVVNialLkRhgj8D5+cr+0otqi45eCv17DgSIOO1ootxUNH1zT9aap56MS6ms9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957651; c=relaxed/simple;
	bh=CvYtV/SZ3/N68blqG6IXcgd9EYI6RO/7AwXt0HZiXpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EvzfAe4Kh82xius5jW9r/qcAdbNZ9h+4oll5CEQw0yJM0wTHGyGPT/heM/cCEnVXhWslnbjlEjfdB5+h6qE6arjJhzI5dh2vVRqfEQb4Mxqz5wC44UBeRHunQevIfp8s64QvB+UBFTb1mXoYH12YYB/dHmuY2azQ75W1SDk8D0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mX13pZHt; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mX13pZHt"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa020fdeso9179a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788957648; cv=none;
        d=google.com; s=arc-20260327;
        b=Gc272JzytIvGYwt3xL8hs+sgLA1KIx9b4KuwJj8s2GL517Ye3qG69kaPiC7Q61cFHR
         TkiKQVcXyhqLLw8n2HmHIxLhMhfBrKs21fwaBvZcoDCvX4yhEPZb2PInNa5GucL/oXfK
         bjYJ+lu9tIMIVaQ4DvHXToiBk3a4YdwRK0pVc4AO9F5q/d+eLeF+Fd5wuviqfd96gJZ/
         jBTvtxXR2kdFHiDAG2fm5VYN1CK8tlyqNMAGCUz8k4X5/eRvTpREXucxd4sJ11XIak7G
         8V+GlnRQ4pJ4gMm8OCVsj1LHJB9GRWFNbQFATk85VAsElyWRvjgc0lJa8OzxVs5I8KcS
         en2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CvYtV/SZ3/N68blqG6IXcgd9EYI6RO/7AwXt0HZiXpI=;
        fh=+Wf/pT+ZuF8AsBDLM1nkr8crPnGbx4Q64qsTrmVQ6NI=;
        b=CunAD0s5SQoVN8nTewkF0G9jhye4uJb+amzDp5bBY8+gjMwxhptX9rH8Hpoo5ZvH/6
         OLLvJ2HJnzGHIHNygXhLm6WdWwqhpDuadrBCbj2kABfYsfJ/oeIQeFjJvQD3vsJUnc7j
         gcgci53JolDxZaXm4F+mIv6jxgkWLDZdMBLnpQPT9MihIJoKnOQqcZb/czqbguRoUweO
         ZnnCGrQfDYYOoYMtul0UBvaLIBZMquf78MdoF5Agih9NyJQfuA2GlBD2vRR1TMb8gESr
         n2AOiFQ8Fz3wSYxyqn9Fy+3pzszwzl1Z85NuYJCraS3moal5i+1qlbOym1cEXDRsdg6O
         pYhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788957648; x=1789562448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CvYtV/SZ3/N68blqG6IXcgd9EYI6RO/7AwXt0HZiXpI=;
        b=mX13pZHt0XOH5UXYsdmBK/FiAX6R2VSrGayXfKqNrNgUi4zNBLJYe9NN+L+zHR92KA
         kZ6WbbvrFPZ/7FbDr3lFOBc6lqHJAk/gC4JvY+dyY4pdlNYV1WzzyMcGCzbco9hijbcv
         Le2uVWct8KMOT53E0r+a5MYT0GEBv+kyR2XtdQQAGETl5bm5hOITk6FcqK4dD2zaM+6d
         TBwagmjI+Arr17dviVbgjALu0aVP/bAawnRlnlCTMYNwP95uzVhsAwkjSjf/G3vFsOYl
         NNlz3WJObT7cjQDTDCvGcvLN1A8QnYh/lsy0hm24hlLqkhPCm1hnhLGLxOSGxvm8b5st
         kKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957648; x=1789562448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CvYtV/SZ3/N68blqG6IXcgd9EYI6RO/7AwXt0HZiXpI=;
        b=FI2g2xlI1sNXhIpHxx/8i5w9S5NX8r5KTqNrnVaB7RhCUE0/6G3za5fl0/epeYToPV
         PIZkORsqXdh4hOH+EuZoEWhkkjHIg2o+zsLekTUOxozb/SCopQGAsTU+CIN7BspjAPb4
         8pm/SLtKdz6ofbtSCuKDYhgRET/I4G7iRjTjEuINORwsrwB1pwQrOD2s7D/sltx95mx/
         V6RydYEnNFPQD5top3putzxdbCIWz+eRyxMOSmc3yepzs/xxEFwwndinQg+llZeC5hUN
         gZGKPZN4it7bUH1yy/UwMK56ag20GePF+RLpvp9i9pfQzwQ+YspaXKpUD3mEQRoICnBX
         znPg==
X-Forwarded-Encrypted: i=1; AKwUvBxQjIGoRg+vTa4QNmjuiw++k6WSC144DrHGPdcqFQ6auxpbuMSwZFKCYn473ZaGfUxkrQJ/1OrWCtOxitI=@vger.kernel.org
X-Gm-Message-State: AFuF++kYKzLxAv+OqbY0bgZbAV/ySdMDD2oH64xZQ8mdLXMM5nj0I+4U
	cz6fLB3L9wX/j8p3snsq3pO4ZEnquLx4gv++EW2PCYbiYI8rEMQm4CqfYoEYdCwAHUfwhsE4vyE
	jFIjIX58vQm92DDpJA89RrkCp5I24Lag=
X-Gm-Gg: AYBFou3SS7fYrsuXIXBX5wTFHta2s/2Sy3gj7HET7oegiHMzECnjT6NvqLI/NyV05bW
	UDNzfMjkORlXHM6SM7yl1KRH6dEwMRf6LFZ9/B5RyRRbxXkScPqiU4S4rJbI9C2wCsSMgKOH/mQ
	yBdpLl8hw4nleqFwOfb4ppDY96TP+bv36Gmj7AGPOlOhg5qSNXGiC/M3YzacoiP2Og0kPmGz+pU
	6K1Kl1Lm1fPGHR3+UUqENEqw008Z0iMyfKENDOGxleQ87Oa9zbvC0q8qvWoLSvogrGJQIred8yS
	q2MsAomaNYvk/Y3zhW+oplvvqd4Wu8LCYOfJEhyJWoxB4tCrH7f9gDMkdDTAi6UIglRQ/1tv0sS
	u1hassC0/P1xOesrnrm0cm76e4imSILQryurjAFLdbVpuGb+k3pOTtWqtz0qrgOeFD7QICzsCO4
	5YfrvSahmniUt/3KF1DlaBzbUHoM1E7Y87l89Xxr8mVkdsfblN/aT6wMZw2V41Sg==
X-Received: by 2002:a17:90b:3843:b0:390:3936:8760 with SMTP id
 98e67ed59e1d1-39b3d3db82emr25928663a91.0.1788957647620; Wed, 09 Sep 2026
 05:40:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909033246.2779303-1-georgeandrout13@gmail.com>
 <2026090955-lustfully-fanning-33f9@gregkh> <DLAR1ECFC1WO.8NOBWPL6WM8E@nvidia.com>
In-Reply-To: <DLAR1ECFC1WO.8NOBWPL6WM8E@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Sep 2026 14:40:34 +0200
X-Gm-Features: AcwNN1XhXoN5_IFb34ArOzJVpKsqjlwNs9WCrPY6BaOeCuMJu7VIDDuOhdGDBiY
Message-ID: <CANiq72mCdDWsWD_O7LJ0i6rM-0C8p-pi-Wqvn4hTWv2Py5DMRg@mail.gmail.com>
Subject: Re: [PATCH] rust: auxiliary: validate DeviceId name length
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Georgios Androutsopoulos <georgeandrout13@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <iweiny@kernel.org>, 
	Leon Romanovsky <leon@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 1:29=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Note that this is not a runtime panic, this method is only ever called
> in const context by the `auxiliary_device_table!` macro, so a panic here
> translates to a build error.

Yeah, this is one instance where `#[const_eval_only]` (or
`#[consteval]` or ...) will make it clearer.

Cheers,
Miguel
