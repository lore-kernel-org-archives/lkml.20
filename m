Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792434419;
	b=lK+84DFfC1Hrg7P6xMh1H1uCnvfI6RVU2G/EcKKu5EszIVX4+hpKoFW897AIyesuvJFG
	 RDVFj+dJG3HgceR07JqAHckkFyiX1cqoC2GBSFF/Nl//mYfEYxhAo2CJcResKuMfR54n/
	 xArmMXJ/cZnwRy56TM2cPSlDXWoeFvTpQR3HYQ/go6PWuPs+mlfSaLjELlrca3YfV0Zew
	 Y94Nqmx/1RiZyxpGfJex70Fa5j0GRM+oLJiGDsd+UCKGdvNJmO9Y1aLfHQiqCTemuAEZk
	 mJJG/Ld+knz4EH/eHyWr9GX7RmGmlb9FpdS3kFQd/xXrTPqg7AcIKye5J+V97XJqfeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t2oeQnIv4huhcfpcdL6g/3ERvtsaXDF+ZLHo7Puiboc=;
	b=icewjVD6uFDFgUaPNC1ViF/vfXj4wnNlE0pAhx2TEnyCgJ4mBbFvZK9eUC+YKjZTNWve
	 9JFePe6yby+4Rv83yoPoolgSwI8PVWN7zQXyar5EqE38s1FZP8kDWMmwXCeD3PU8t8XQE
	 YlVPFeOhrGfxEvnUqnQZ+rbxYtnN/9yyEUVsVlCRioUgv/G/2ftP88a8KQ4qlc+92YIA/
	 xxw6q49xl7wnYGoNMWNY+Rqs62ILe/LQoysvX/qAXM8285/62ZwSjjvkCCLZO2oEfMbsy
	 EZPxxqqhBmm4tP+H1BussnViZZF0jc+H+7aXnjYt8r3DuYdaTgGDxKAmm9HL3W7qbFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="id9dgP/a";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D1160A383A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2D1160A383A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=id9dgP/a
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso373316266b.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:26:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792434417; cv=none;
        d=google.com; s=arc-20260327;
        b=n5ig8K+dt1awQUuXgT5IhvBda5uMp+PUnSaMUWYIu4bn9bwOhDBArm/k1h5tyBdIgQ
         QGLMcnP0ehMCaHmIN4Nl9fk8AZ3POA/EP1WFhMH4hSmpk2HwOLSnc57lkKhmr7lfK2NR
         6YZqJszh2wW6CzDSzi+51rwNvMJrDEBYBCu/IlzEh+QeaSvjAe0FV+nMzPUqS/pjzurM
         0bvsQikrms0u4vyBDxHr5fAS4+OmsqlrewKv4wPnyx6tNo3cH9AB9PbLl3r5qWdo6cQy
         aiDCnjEokfkSzwVIneVBCm5G0MmujWWH0ai8T1HEaqgilgt55BhJStdad7em5yMgYI5a
         JePA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t2oeQnIv4huhcfpcdL6g/3ERvtsaXDF+ZLHo7Puiboc=;
        fh=JM7bQ/AkalbtD4s9tb/kwb2MRHwOAcNftOCVKx/c6cY=;
        b=SDqDG39ZejTx0QHFNEGLMLeccuonDTfHX3s8ro1G+dxTAWwKHizkRvFiYyDf+rJP3V
         EvfmSMFAdtWkDjprEFyT2UOG39MPZmfzSJQAPWmZf4USodIu0q8bVttgz6veVZ6qi2AX
         YDNi4bvZZnWOOLEGoFJ5VxgzMVmjW+zlSc3r0tWqVmn7jUTwaI0ti5YIH3KFIfoAArjP
         QQOB9R9OrGUXABojyNbkUA+pEsDDiXrPt+DgajlJeGIJUVL0UUwNsHjJKh723gF11cSi
         izWn6lHLl5vV8cfWkyTYOntArrkFbiM5vnFH5oWSxbQ8+R73LV1w0OqBDZFZAlsh0Jr1
         sw9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792434417; x=1793039217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t2oeQnIv4huhcfpcdL6g/3ERvtsaXDF+ZLHo7Puiboc=;
        b=id9dgP/aGON5jHxySeoY8/7bhA7Bw0yAeW0ixcKyXHGGTbR8Q1ZcEAPn9rhloJ7eRq
         WzvidabKvzF+/Emp7EdUvl2T5ftFcEb8Y/yAIGxfM2lcU8+QbtB4szJZa0kD5HpFibEb
         WmA//RxmKYrsugjs+S11KDxcnHl0ZUiEPmnC6ZjAzm+cjcAt7//0K97wJNLa51NH4Tzy
         tczMhyKoKlDlTzIGCBMX6q6k2+MUow4nx5K8iGW3yH4REYJwWSWGocNO/qe25zEy8bOL
         LPAGbaDxJZIMzKsPTpPUCK1u5he48Z50DIEKdzeh/xX0J7wceyllz3Q1Pw/2lfEs49Ph
         EZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434417; x=1793039217;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2oeQnIv4huhcfpcdL6g/3ERvtsaXDF+ZLHo7Puiboc=;
        b=XhY3aiM8Y2ByWMDTEflArwyz2l/ORQeShojzg67SdRNZ0KKc7Jen3McjTDPS0/0uxv
         RsOuPGkiptR9hD4DxeAesGJi8USb09Kyllcl0Gbc+IK26q0OYhtuXrVJsXAwbZr3p1ty
         J8ugwtzN/Y6RTVk2EWrtRJAF465yrDyG2GhozeSkoVN0Vw5ImrntNrp8Z6VsLdo2Jz6I
         v2I3tcA1eGk5ifw/Z5lOGD6WhtVkci3GebBhRJWlNEqs0flDfKpcSjZ2N0rLnG5DjFus
         KQrZAWWNcV2E6Dl3ifU5r3oevwrjMQvhVqQUeO3MHNA3CAyMGul8/UOBTIo4qCl26YXB
         j8rA==
X-Forwarded-Encrypted: i=1; AKwUvBzDKz1wHt4ZSdZs4IMyvaPKcWdaPpVJWGyqH2wJ7kbXJDoTUOSl5esephzPGe2xwE/m0fPzpKSfYryS+ko=@vger.kernel.org
X-Gm-Message-State: AFq9FYJj2aBxMe/ZLb3imJuOG5mP2EN7AMAgMx8EGs0gYqxC1m96lX/D
	Z/w71+qfe+ovnj1Z+O6hMUWUEKkoX84N2asgHXrVMME3WlyqVWB2uHUkOd1cIIgim/v7wJg6ga2
	av6UmZQeb/MBf+Rop705DuOAczc7lMJbOR7ZxL6VZ2A==
X-Gm-Gg: AYBFou2nHNg6XfjN3bp1LX6Uw1VwjFt+LL77dU8p+D4U+TmMq9ZONCNLov/INjjP6HO
	M73qbwAl9cmGBQSEqWEqOUa79i9HKdP4uz4LKzNZ2gxNYKZIeoDS6bW6eIJh/vvBw3tBIylohxP
	snJ0wrylynnsUp7kuDuo6VbSudhtdditwuKMdy73BVU7rVxL6CrNDI+pCQOzjMzWc81mTUBsF2L
	bDu7JF1zmSvErlpu4Yu2Xnlu/HYS+zeGO5CxQkErUj0UKPdfd2RYkdOxUjwRfYhXNKrywqVrWWo
	uzhFdTWpPmoSdQy8U3KZUzVSqz4RwsFX+yEXLj3cvJfrvGF0zOW1m0Yx/7qOzJRlZb2Frbw0IrZ
	h9Y8n/gDByLk=
X-Received: by 2002:a17:907:9445:b0:c2e:3a72:ffbd with SMTP id
 a640c23a62f3a-c419f906e41mr596826466b.41.1792434416971; Mon, 19 Oct 2026
 11:26:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260605105513.354837583@infradead.org> <20260605124052.227463677@infradead.org>
 <58dc8e8a-7260-43ce-aebb-8d9c29a6afc9@okonski.org> <b1002150c3e4f877d04790cd8e85d2149d17722f.camel@gmx.de>
 <atZM6uF0CqCNh__I@vingu-cube> <f1d0fc39-6939-4fb3-a422-273cd5c347c4@okonski.org>
 <CAKfTPtB_gMM7axqM167_Tb=WiChskGPXFDgQ4YjVz4Bj+ZiJ0g@mail.gmail.com> <01e25832-955c-4f39-a902-6cc253a2791c@okonski.org>
In-Reply-To: <01e25832-955c-4f39-a902-6cc253a2791c@okonski.org>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 19 Oct 2026 20:26:45 +0200
X-Gm-Features: AclHuK90r4FeeoWvPhrCCn1htGhyOf35EnRL7HTpsvX3KQMMhx770D46QVqgV_c
Message-ID: <CAKfTPtCVknqCO45p7oR3s=1fNEmDW-jv7-wtQh7vwkuJ=UmVcQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] sched/eevdf: Move to a single runqueue
To: =?UTF-8?Q?Jakub_Oko=C5=84ski?= <jakub@okonski.org>
Cc: Mike Galbraith <efault@gmx.de>, Peter Zijlstra <peterz@infradead.org>, mingo@kernel.org, 
	longman@redhat.com, chenridong@huaweicloud.com, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, tj@kernel.org, hannes@cmpxchg.org, 
	mkoutny@suse.com, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jstultz@google.com, kprateek.nayak@amd.com, qyousef@layalina.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 19 Oct 2026 at 20:24, Jakub Oko=C5=84ski <jakub@okonski.org> wrote:
>
> On 10/19/26 20:04, Vincent Guittot wrote:
> > On Mon, 19 Oct 2026 at 19:36, Jakub Oko=C5=84ski <jakub@okonski.org> wr=
ote:
> >>
> >> top of 7.3.0, it still regresses from 7.2.9 if you test with a nice 19
> >> spinner in the same cgroup. I think it's incomplete.
> >
> > This patch only aims to fix the sched_idle task group case. I will
> > have a closer look at the nice 19 case. Have you checked the different
> > cgroup_mode with nice 19 ?
> >
> > Vincent
>
> Same result in my nice 19 test for all of up/smp/concur/max/tasks.

Okay
Thanks for the tests results
