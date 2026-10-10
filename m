Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D44E353A95
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791600781; cv=none; b=tR/TkfCRZIP/APzjsXsgkTQuIZPNBEpLx+niidvUFXobWVp8AzvmiPEANtE5FnDhO/XA0rqhEfPPT3vbgVwLswKddgNESS96KiHb9R2qTqPoJYdZ2hK4m9LFJytmNQ6x9hV7KmBIiYeuHbwSUsTKOvPttpUsPbtLNw1EAWc7cUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791600781; c=relaxed/simple;
	bh=4Qs8lgaSJwPhckGmxqTCEHOFQ/iOtEbQyOhqJpHAVEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jz8nQZSDIH6MpsHy8LjK2a8DFrXXyLe1qUbeI/hWV1kLiFVH6W9pD2VxlNrPvZ8nXLclbpWl2LpSE/uxuN/EqKKeG6gnJ9HOfadkh+9mKyJg9/989q5+kN1TcBlCxpZYUj6HtKH4vNDyi4VZcc29WfdcIoBBkU3Ekaspp+Y8BeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H93zw6gq; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H93zw6gq"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-141395927feso492260c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 19:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791600779; x=1792205579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Qs8lgaSJwPhckGmxqTCEHOFQ/iOtEbQyOhqJpHAVEM=;
        b=H93zw6gqcTT/rOMShwVjoqTE3Cmrj4P62YIoApQbQ450rqRg7nWIrWf7JUoBFL4YPL
         VVeVNsAr3blxFppPR2Sl/ti23sRkOGxl7vuUhIW9/sbECXdPUyrXHQaQXZzPKmQSwgb0
         ciaZbABZTKcMMFwTjnmsb+K8gMgWPUzJFemfKtwHhzX3HChgx+ilQS2QiZ7vgGvfL5KC
         IMmCbYLI+iIjNPnqO3D+o6d9bhZGG3wrBQ5j+BD1Rs9jDb83rwJLi40GeFUmwJTzHELE
         KFL44rTXapsMZK5S2Bb6txkdEcLTmj70Mq7Fh1PFe5hQpv7sOOcqrs/7V27tMcqomSJI
         TqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791600779; x=1792205579;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Qs8lgaSJwPhckGmxqTCEHOFQ/iOtEbQyOhqJpHAVEM=;
        b=VPmG5BiTFc1Bp8kHwj4MGPFopGuv/bxvbtlgj42xYQD7ViFKTKJfDk2qoe+pj1TolM
         yy9/NYziXKIlXF/UYINGqTAeFUKXd7HLsYn4tp61HaWfZZazI1K/zGb5Kp7+1eqQBGkF
         2TKAb/Ju6YWch3qaJE5HD55EmVFXjUkkxDatBOZgIBldvcDTnQlGvkm/auPMQLf0WPgG
         08H3zbyyibl9RWqn8vHJHHHxNaRe6XVmHCYf70vMzVHiXwNK7w9Fa6ZihVZ8D8wPUrbA
         YzSvw+sGfBxN8CuxIvu63akgspYeuRbadxGpHwWvUbno5Ao8KNEI5ufoZaXpfGdY+pZd
         gGxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxX58ZCo+63U//1+807MnCYqfJX/Q8dVyxBDjjjxG9HsHKWVBuKg4BOODac5SEtlc5e8EIB2LCRdnixNRI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxXtT6aotlR3+uo2FCgFYbJ13p3W3/NCznlKO8FvhvEdrBzFQD
	cfpgKwVNXUJ3ltpuLXLuKzEqBLUWs3x0q5ydGIPHErQ+zOWTfaqPA1dk
X-Gm-Gg: AYBFou1uZ2JKMr59h2NYCDr/Ebx0xZxRauUN9Z0aLtSVcfnnehe1zFrY0cy1wNh+7ds
	HhlDD2Jqzi/R995MtIr2v3dZ3GozxDKnc1Cbdi1nxqzXS0A35sSNA4xheatY/gvbh0Qp56OAkVL
	M/apCmhIATIGy6IouwX5byuId9eYF29oaCmPEhKpAV8+EwMseJeqMXW+LZVNuHi3q6UUrDZMFfA
	tmuK3rOAueCGRAXt1HETNg55g/hNeD83iy6NA4HWoLUj5idfE891xgDXkKJznVMC0PMmK6v2fa0
	fImoF+QbXsg2sqkXpxeoYBkBVYSTNvRlOmK58u2/8x+0OCbDMFHCxVtJ/1uKUdeXlbgS3pP/fvk
	4r3JOy7WTIFburP2obsPNhVxZRInEghke65Qm8lNpLrX4IWXitfwfyIFC9ngOxaUA4jViajnEqa
	PbpdJcSJFRpoFW0UZknKq37DodKeOXSJpqT2AZ4KnzBMQc5ygeE/MGR2+w6pYUkw==
X-Received: by 2002:a05:7022:3f0c:b0:168:3243:c91a with SMTP id a92af1059eb24-16a5dbfde08mr4952922c88.13.1791600779010;
        Fri, 09 Oct 2026 19:52:59 -0700 (PDT)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567aef5sm8975712c88.19.2026.10.09.19.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:52:58 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next] selftests/bpf: Accept unnamed dma-bufs in the dmabuf_iter default test
Date: Sat, 10 Oct 2026 10:52:52 +0800
Message-ID: <20261010025252.3716641-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CABdmKX2VHqWrPb2O3Uqdccx=nP66gECU0kVc=4tZdGqSEZvuGQ@mail.gmail.com>
References: <20261009-selftests-bpf-dmabuf-iter-unnamed-v1-1-962ee94f7a5e@gmail.com> <CABdmKX2VHqWrPb2O3Uqdccx=nP66gECU0kVc=4tZdGqSEZvuGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Oct 9, 2026 at 5:07 PM T.J. Mercier <tjmercier@google.com> wrote:
> Hi Qiliang, are you running this locally instead of with:
> tools/testing/selftests/bpf/vmtest.sh -- ./test_progs?

Yes, I ran ./test_progs directly in a Debian testing VM, not through
vmtest.sh. The VM runs a GNOME desktop on virtio-gpu, and gnome-shell,
mutter-x11-frames and ibus-x11 each hold a 4 KiB udmabuf without a name
(their fdinfo shows exp_name udmabuf and no name line). As the
iterator walks every dma-buf in the system, default_iter fails on such
a machine before it gets to the two buffers it created. The minimal VM
of vmtest.sh has no such buffers, so it doesn't show up there.

The subtest only checks its own two buffers, so skipping over the name
of any other buffer seemed safer than relying on all of them having
one.

Thanks,
Qiliang
