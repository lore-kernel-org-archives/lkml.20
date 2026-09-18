Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DF333A02B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789694999; cv=none; b=fI9feF3X75lWZMBYqJu2ajLnlgvtGs0Csj6dOoEy2ENOJF1jwBJmpcVrM6AIRlgav9YnMv+K/xWDThHUQWfGk3Qa9OU5kifwJApDZDPreyoCcoom/ytaJKLEwT3ua63F7nswR99TrdilZs6a8xTkEGxswLLkxPTaDRqmpFUzsos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789694999; c=relaxed/simple;
	bh=iI0zBzfG1hsDHz6i6vCemlZH6syFW4P/KDHxX9QZmH0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=Oi8XrdS/UhyNJ3Gb+UdMBYy/IiX+29Jq9BVF0ssIWkCE7kvBl/ASEDuzhGlyysx37f7LKtruIDVcUOdWS12IHm7/7kCtXEglRV15Ve5Sk6ThNI7nk4G6q+EMWaI/byMtH0jwPYbS0H+3ifhN/0urXwKWPlbdV8udZkA7FhG8bXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDWb7+RZ; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDWb7+RZ"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc5121bcf1aso110253a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789694997; x=1790299797; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vbHRw9e+J0REPOf8TNkwmKIHKyLdrdPDh38QRnbIRiU=;
        b=ZDWb7+RZz6kDNMTMVo45vxMMmT4lWY8ib4Psim9IR/7F1UrRdLLvZU41bjagMzVUge
         isFKXUbZ0BjxvBg4hdWHm+h3RVaCIJscz/JazMhxGsV5JAv9QAWDbKNTldZZyjY8JYtw
         2e+j7lUiRsAGeM9oYCsi+OlMEvTvnhGl3ZDgW6Gkfy0WFEohVN23djw1rgwxHfJZoHNq
         031kCx3EAR0hsWDpsWt+DXbNOzGXB0ch5un5zWjuLBwjotojhddFrI3rqzN6IHMRP+cu
         rSrsbz6cy1gp6bqcNoqJHNhLta/VRRMW03AIBtefJxqFBwjRYlCcpE8GDFKrKGbteD3H
         ZONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789694997; x=1790299797;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vbHRw9e+J0REPOf8TNkwmKIHKyLdrdPDh38QRnbIRiU=;
        b=0CY3KJq0/dUxIzBYlKuACHIpwVB0UcHgEA23gczhbHXyxRtJj30S5v14tRibmpYCcn
         /ahhJ6hc5WexSzUDvqCpt5Wyawm/JExhhD55Qyn0W9weDa6nFbL+sXG1MS0fbgBXfR9p
         lH7+5U6sRt7npH4S7pPNgqMh9HX64QAH+VpANXh2yH7KPtUtlTxdz6gLAmig2yiSmOpn
         mnvPxzN2fGnL91a6f0jf7UNWOOOi7q/GPjbas646R1bgTtWuN5kxBUxyOrAiwIXOU0Mm
         Zg91ASiyQjWb7xGpqZUPM515C1OVCNAy0h1EOb1K8hD1rKVGt87s3YHyNOIB0t+y7YQ6
         Pjjw==
X-Forwarded-Encrypted: i=1; AKwUvByixL600o7AfAgARmAN3AXFA2mVXJ0A07xhRi4nXH7768gRAOv0Z/q6cNEdWb+mjcquedM6jAhPEAhYFwg=@vger.kernel.org
X-Gm-Message-State: AFuF++l9bqiXqzw9f/abu04vpqxsY06DHMdzy1I4mngOaBV9Knf47IR9
	h/DWfcd2f2c4Q79bjsvxNPBpQ/o3foP5PqSMhwrOqoXjb98UlfObNEl4
X-Gm-Gg: AYBFou0PV6W1vn7N6WjdpU2aJduCeqLsnX5k4jwD4dThoB4IKfVil5+6c8pdAWYTvOD
	7CyBgqrfKNN4FO7uIfa4V7w9tVexjyNjfLoNvdu2yr7uuLkcOiUWkYAd0oR+iDX9kD6Ak269rUJ
	zszmkw4HjyL9MPFK34IN7YeMMB4lHIH0eJmCX6yenpcICh+4SRQWSr4K9Suw+z/dV+QhD6tdMXv
	8fk3Loky62aM7CTio0QViitgJ+JqI+3l8+SYfAznrB6YACMUpkH69XLJzUlNMRvD/zb0vSjhyqJ
	JJTjsiOwHpoG/U61rsCJPhvfMbOhWKjYbZXegTCsmUbupgygodPcMrKJzdA7Er+7gHUgARZpKNh
	KbuhBU+grsdWiwFDdtb70z+6Vr+3SdE/KNcoO5IcbpnLj7xl8Nj/OppAzT29QwyaRhM37oh9kGh
	uXKJMWAKm8+a9x2jR/j1DTSBy6ssLfxU18HZayqSL+Am0Z1ctGlxUN8+9ZQWAvudVBhXzNrr6Io
	FFbQmoifcRkV9KPeioBxfT9D2ibi5FS7E0h7o895BWrXUuLcgcpg6LBKE5Sd2QK6OrlJMiRLz/t
	mby+
X-Received: by 2002:a17:90b:3f84:b0:39e:4c7e:f042 with SMTP id 98e67ed59e1d1-39e54f91d4amr1930776a91.31.1789694997537;
        Thu, 17 Sep 2026 18:29:57 -0700 (PDT)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e36115cc8sm7493789a91.3.2026.09.17.18.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 18:29:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 01:29:56 +0000
Message-Id: <DLI1XF72KLXJ.3JTQWV4WFT55P@gmail.com>
Subject: Re: [PATCH] bpf: use str_plural() in diag_print_history()
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Lalit Shankar Chowdhury" <lalitshankarch@gmail.com>, "Alexei
 Starovoitov" <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "open list:BPF [GENERAL] (Safe Dynamic Programs
 and Tools)" <bpf@vger.kernel.org>, "open list"
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <20260917204648.9110-1-lalitshankarch@gmail.com>
In-Reply-To: <20260917204648.9110-1-lalitshankarch@gmail.com>

On Thu Sep 17, 2026 at 8:46 PM UTC, Lalit Shankar Chowdhury wrote:
> Use the string choice helper function to simplify the code.
>
> Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
> ---
>  kernel/bpf/diagnostics.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/bpf/diagnostics.c b/kernel/bpf/diagnostics.c
> index 0abbbe177e31..ff139777ac64 100644
> --- a/kernel/bpf/diagnostics.c
> +++ b/kernel/bpf/diagnostics.c
> @@ -2354,6 +2354,6 @@ static void diag_print_history(struct bpf_verifier_=
env *env,
>  	if (log->first_seq)
>  		diag_write(env, "  %llu older causal-history event%s not retained beca=
use diagnostic "
>  			   "event storage reached capacity\n",
> -			   log->first_seq, log->first_seq =3D=3D 1 ? "" : "s");
> +			   log->first_seq, str_plural(log->first_seq));

Nack.

Instead propose a revert of commit 9ca5facd0400f I will be fully
supporitve to delete this obfuscation garbage.

pw-bot: cr

