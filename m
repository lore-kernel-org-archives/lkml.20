Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9A249F112
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789147808; cv=pass; b=SBVOegcysE8AgeEOegiMuQ3WRY1/0KXL758IDIzONMteASuF5/mQCOvMb+bXwXaO2QaJBW9F9He1EEaX1aiAlHMElnHcIR8rej0ldgSsnTogceJ5OByW1Jh3WKdEQhlRH+rvbcg079m65WGQ2z2VGTQGJ7eYayBsZYbtvIfL8/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789147808; c=relaxed/simple;
	bh=5gGgsI8GcZxHT9usDxNoRaPkDvtayTcX43/EEKCySws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AERqsBspzyOE6z/UtElxzfW5Kk0CDP+gOVVp/0bAPapVmUbQGbDvD57Z+USwnACMiYkDiwLThceSssCFFTi+CtzG8MDZrPAZJq5Jd6iSUlsJze9jIq7QNXCMNtRG6NtLrXsYym+LGqb9xBpbfZ3vg8RZ7n6Ddt33gsGKx1XgHWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rdlBg6Zn; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rdlBg6Zn"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-398a5aad413so1233904a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789147804; cv=none;
        d=google.com; s=arc-20260327;
        b=EOu5ZwCxFVL3D0l3sAKXEH1f9EkCMPuQVhMXUWD6TAC1FEMROtdEK/6kAY1PIbzSmX
         spbo2SJK/5w2K3W0jFy7tEfL46O0XYjCnXMN0QUlEcWt9LpgmEwZJ3Mh6TKUhmGr5YJi
         ZEg9K7VDrofYN47XMaPy7vvg6/UB6QDUHzeQX4W2GLSnRqUfXr2dzjPyt3UxbWglDOvR
         rvfe0PXVzZq6Kn0UohFE+Qy3mgSi30/o6MXj6OrW0WEk2R33llMqvMQG9kNw4aHnXY0B
         4pWtbeCyH0iDdrxHSWRNIhmNBO1oFR+0uVyqrb9V+LeGd/2iA5tbi8rLRHYiIFg0sWD4
         NSuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3NF3c9m2fPvi3tB99v7eLP1rvK9UDMOvXE6ZSXik2dU=;
        fh=KvrovvRZ4LcO9ZGW46u0/ohLiZUWAPBqe0iHg05DFP0=;
        b=JEjcllO+OwSm0tV+eDwuiUtcX90g/cUMduoI/+MaxuP32y6cppe9D9pKM/YLXehalS
         G8KxJv4k1CTqWSsmRy14gPz0oAgV+A1TOO+6JpJJ8viBeRctLYz9TXqj+S17UFDEeo81
         cc0fig0ZzWTpqzdu+B6otPBzQ6wYqtaPqTPFFaRyXcA2CVN2ZedgJ5BkirQCDXatuDOE
         yMXGvrc2aGoIOfx/L6/wlUD7R1jUPXjhNLawgW8LC4maQH/k4cKoUKAvg/y+0IIXLgP+
         FlOP3vQ4mwXBekyuKwyKNLI7EX5IinmZAk+Vl1N7wbpmOys4Tnc4TMoKV/Yi8M0ipy3O
         DRsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789147804; x=1789752604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3NF3c9m2fPvi3tB99v7eLP1rvK9UDMOvXE6ZSXik2dU=;
        b=rdlBg6ZnxG25/TBSGPJZ8kJCaUYkZtyxZhaOVvu3p28GHdzTch4t7gdwoGevqlnhsf
         MHh+jP/KAUO6RgQS2WqwQdlDuOYTraPjeTTCOv52+hCIs0i7RGSpLmHzP76hFYg3iM/n
         24pk+woCyjemKvEeZCkM2H7khINugREZCOOTRnYTZicfHwh/KSlDonbGtBGFUnoJQ3Yo
         A6KWlx+lTvBQ5+X3Cm9OHiGUNqr+KDZ0pSsAKaSXTiUtgzibfQ2r1Zq2W+ok39UYSdRi
         gr40jw+KtIlsQFDHJgRtD+JQwG1sF/8s88iucl7NrJrR31EcTbqk1oSEzMIbgGd5VE2b
         aFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789147804; x=1789752604;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3NF3c9m2fPvi3tB99v7eLP1rvK9UDMOvXE6ZSXik2dU=;
        b=DsJ81T8zW7zjnNJrL1wiyYnn56M8k12/ofaRDrrNXShao0DxrVDODc6KtAFaSPfCjB
         bGv0nzKphn1SvcqgTrEJmUydSOSJjvZ3kdAJTH/KIkxMstmn2YeUUPHdMGPr6znUrFfp
         zukKk72N0GEc1on5X9f7agXGqzFTrG+rwmXRvIvvG4BP33eGt+Cz3BVceq39V83fclcj
         EDrxBw5KOPX97O081hGbLBjC4MCCs4t4/ct/ou73d9dai6lZKWb9z0P1DHoSALeWUT3s
         NekcmNxANYoUytZUPiRNyewNVHxDJj9A6AFofqU+CwnYBSSCY05Gbv0xKyqwtL2zPgWM
         Tp+w==
X-Forwarded-Encrypted: i=1; AKwUvBy2lkce8IkILpjjHVKLMWCUjbgyXnkoFl8bBQgmef4Rr0LNAcKt6OuOZMU+LbPMWtN3G78R5JJn3k3FiKI=@vger.kernel.org
X-Gm-Message-State: AFuF++n3og++SjfOYMPQzdb3F8UjeZev8I8a5+eBm2V25IW7gW+OotGI
	7ez8r/9DPViyts3SbGJedkfEVD0jLOIa8kM0s+ewXd7gJLlNYaP04siiw4ldORR+WohbiaOtLMB
	X1nUrgbSLvTzZ0tA5nSI8sXhjRjFdS8wyq6tK
X-Gm-Gg: AYBFou3ODKvdsgu0YV27l1/pkoL6jvsHn7BapgFIdSFc4lLkKuj3VoUh1l4VqASMhRR
	qBHYtE0OqCcGGK4lgcpuqKSOBx5/eHLQDktNW831i/VaCyPMfQbLG0j9fEgpTJkFDipmmZnL39J
	PXwJIG1RV8Zje4CMTN0ManO+8MjduV9PG4Og7QCrnijzc5x7TkR2c0OdyWmxYo7+xRBGASRTcoU
	QDRCziNOjIG1B7pTNxxslRJ/NB5W2YNkkhke8/l6KACV23TrVMnStDQS6KVJS3DPqjqpUg53w8f
	CVotfslCdRSiu+obyNFEoCdrEs+sHILsoF/cUqj0rYtwX7pj4dJKC02urn47clcEkrKvqE4PIYq
	ptuqdrPGx8Spvf0mMbJ6C66xjHTbHT3LokdYT
X-Received: by 2002:a17:90a:da8f:b0:38e:c232:9d3f with SMTP id
 98e67ed59e1d1-39d9bc1007dmr7733663a91.5.1789147803693; Fri, 11 Sep 2026
 10:30:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903082616.5096-1-liujing@cmss.chinamobile.com>
In-Reply-To: <20260903082616.5096-1-liujing@cmss.chinamobile.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 11 Sep 2026 10:29:51 -0700
X-Gm-Features: AcwNN1Wa7DKAysUMgK6DMEftF-wB06LhJaFnpZXE780rtwUke49YbR0GE29az_o
Message-ID: <CAEf4Bza+4YgmWSVvpW8=Pcf2HFNkW_eFSHAaU16ei9mrf8Tt2g@mail.gmail.com>
Subject: Re: [PATCH] tools libbpf: Fix signed shift UB in btf_type_info()
To: liujing <liujing@cmss.chinamobile.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 1:26=E2=80=AFAM liujing <liujing@cmss.chinamobile.co=
m> wrote:
>
> From: Liu Jing <liujing@cmss.chinamobile.com>
>
> In btf_type_info(), the expression `kflag << 31` performs a signed
> integer shift. When kflag is 1, this sets the sign bit of a 32-bit
> signed integer, which is undefined behavior in C.
>
> Fix it by casting kflag to unsigned int before the shift.
>
> Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
> ---
> --- a/tools/lib/bpf/libbpf_internal.h
> +++ b/tools/lib/bpf/libbpf_internal.h
> @@ -259,7 +259,7 @@
>
>  static inline __u32 btf_type_info(int kind, int vlen, int kflag)
>  {
> -       return (kflag << 31) | (kind << 24) | vlen;
> +       return (((unsigned int)kflag << 31)) | (kind << 24) | vlen;

this was recently fixed as part of slightly bigger set of fixes of the
similar kind

pw-bot: cr

>  }
>
>  enum map_def_parts {
>
>
>
>
