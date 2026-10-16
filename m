Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE9644725A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177586; cv=none; b=ere/oQ8kBDgD8HAZgOuCIBVgshxSpE5vWlINkz10TwQIjxLJaukakCuUDnvIJfRjBKD3oaywg2iKr1PfPRZAZNrR+Dqshl5PVE6nOKCiAEeKUS7CutI3+TLgSJYdzCcCgs7t52CbtOPYCKlLu5pX6BEJ8Zh39LIxSik6V3d5M6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177586; c=relaxed/simple;
	bh=OpMS+6FzySrFV1lZQmnL5w19GqRngTRsLy37qcsUoFA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=eTVQ9Dt4ImcGun0BzOfPt7m+A0vY8pUd8yeVRukOJAQjuSK3wQuSDmuVK77ErBM79JaARO09RPc5DK2XZl9Vua93X3TIme0sUajgu6ZrnUn7HFBmyOadcDITcNH0Huc0IMFOBjO/045khyctaFbU0eJ0uu5sdVcCQS7Xr2PpnTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVzllX6t; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVzllX6t"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-88bd2b44f3aso171665b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792177584; x=1792782384; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hSRgHunWgFpzvexlIiLUerDvkn0BvQ3M9sVaWvKaM2o=;
        b=TVzllX6t4/7axJ44qluE3Wqf24CWAeXMDP/8PMzgpG4edCwkSNK4FxNCXc5m1M39ju
         pYHOqkbq47OI72DdsWSNKjsLyWNa2p7dZfNcI3913KjYjUAP5PVQsAaHK7wjZWUiwJlP
         cMhy5csnEi6W8LKOtFQTk1v6TK4mgjIb0p/aGQZqWL6Gwo+D4eNH4OTLq8DWYV0Ek6rS
         fUgs0dCBjA63jMds4Ee7QgLeEbb99Xmqy4auhUEvZIbLpPb2t2OCGtlgW9fKQxb7G4lD
         pRgvj3KVqKUJN32sdge1YObB4QsRQxn6uWHW/rK+mQo+a7MRFRr9eT8Oe3YD2+2QJBh+
         478A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792177584; x=1792782384;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hSRgHunWgFpzvexlIiLUerDvkn0BvQ3M9sVaWvKaM2o=;
        b=YJKG0ocwLw4Lt8im4z9DBCGIZck7JM5VD57WfUWvatO/gb+5TTxcz2dVkxMcj8Leco
         x/1WHgoBwpqr3PaIskmzirSbpiU0qnHKbjv+Zfz3rxCB/G6tKThx3O9M1U3joSFVvuBN
         0tx3mP70MdpkGMKcahb9+Fb8ujATDvNuwNBSS1b2prJ3dM5RtOdZNwCUcWzvigbOMAUc
         7OnUsP9RFkV0Y9HKWVdanai+VLtvvFekPoZKzRee4MlqBE9a1i6KRz6N+GA04xP7j9lO
         EBvIUc3vgM3743QH6Hr8WKzRZ7ZCLrfeZSC3GrI0leAENzlmkVTngqqC06NoRJXDXU+h
         H4eg==
X-Forwarded-Encrypted: i=1; AKwUvBzu2t0Bb9pBrW/5CJaK9Js6822pyWABXc6SiCaj8s6uQ21np3r3gCmSkXZ0XJrNL1IBBaFeA8h4NFAIy3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhMN6qHg2NJlNr+GjAVJ+yC5AB0KoyPnbGPVLZ410EI9Zhi3xL
	9h/GvxPcZ9xkWRCwwQk41LRWUxE4nI1kj8OosL1pjrx+kx6a1sH+iM8X
X-Gm-Gg: AYBFou3wsosq7IO0x20mkVJeGVgzqugdRXSPQHwM3GDb6IKzG8qKDstrGx8XuFLumYV
	ScwaV/RlsPyo/iA66PrxpZlw4V++XRKAKzP9Umyp5C+xhrWhbZ3ETU80EHg/4Mv+HkXeiHms+Kz
	8XFc9rVM8Twi4SXj9/FXKxuBh5+0uV9KgCuoG7PhDYAwylrSz3PLLcLKYF3wQXA3Myt+2DQxLfm
	CKpRMIBcdm1O6O+xrnl8L7mSOWsc5jo9M8/aVQfR+CrRrEy0DS0rwAGvabI1Op2pXr/LQRRow2L
	5IKntMofA3v8YBj+NIgk7k2wlidBVK3dEq03eeDX1o/gCdwM/wUbIsTkZBm7/1MbZHbmTA/F9rp
	TtkUYIT9H4NwAjRUWtiDZbq21w3jw8CIGu5mzNd47NVgrDiUxvm0da7cWJ3lafKzAMZ95ou+1hY
	wxnHShphB5CkbeaBFktPtmXBHsWVqcKzUQ9aLtnuVFHDnkrWmlO8zIGcb+07R75IDHXuLIK5rnP
	EUYfmPT62jBNGQ2wToEB11w8/LtRa6a58Gp44afcoc4phHotMyrWHjM0gwnZutsYLtgVWaWOeKE
	e68=
X-Received: by 2002:a05:6a00:2da3:b0:89e:43ee:6538 with SMTP id d2e1a72fcca58-8a04be62fc6mr443146b3a.36.1792177584089;
        Fri, 16 Oct 2026 12:06:24 -0700 (PDT)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f5735dd55sm1563594b3a.26.2026.10.16.12.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 12:06:23 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 19:06:22 +0000
Message-Id: <DM6HXJLRTM4D.H1WFBHSKIH2W@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v4 2/4] bpf: Dissociate struct_ops progs before
 the grace period of the map
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Qiliang Yuan" <odys.yuan@gmail.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>,
 "Amery Hung" <ameryhung@gmail.com>
In-Reply-To: <20261016-selftests-bpf-struct-ops-assoc-timer-v4-2-9ad31c21220c@gmail.com>
References: <20261016-selftests-bpf-struct-ops-assoc-timer-v4-0-9ad31c21220c@gmail.com> <20261016-selftests-bpf-struct-ops-assoc-timer-v4-2-9ad31c21220c@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 16, 2026 at 10:59 AM Qiliang Yuan <odys.yuan@gmail.com> wrote:

> -	map->free_after_mult_rcu_gp = st_ops_desc->st_ops->free_after_mult_rcu_gp;
> +	/*
> +	 * A prog dissociated in map_free_pre_rcu() may still run the struct_ops
> +	 * from a bpf_wq callback or a sleepable prog, under RCU tasks trace.
> +	 */
> +	map->free_after_mult_rcu_gp = true;
>  	map->free_after_rcu_gp = true;

In v3 thread you asked whether to leave it to each struct_ops.
No. The owner of struct_ops cannot know whether a non-sleepable prog
starts bpf_wq.

bpf_map_put() checks free_after_mult_rcu_gp first,
so free_after_rcu_gp = true is dead now. Drop it.
st_ops->free_after_mult_rcu_gp only picks the gp for cgroup prog array
after this patch. Update its comment in struct bpf_struct_ops.

pw-bot: cr
