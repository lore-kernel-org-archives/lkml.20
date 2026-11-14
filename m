Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794624989;
	b=ApJ8u17spH9RwfshEv+FAMatMgh1SGZ5QrBLrKWiAV+18vOe5kRcOjHTymzWL8GlCMJo
	 smZqdhuSYrWxFlnzV5AeNXSUid0YVqW5teO3x7CYlpLc/vnHNRmpumVIdyeuZg67CF6KL
	 dUSi4Pcka0VI6jShU7n64aJ9y0GspjGZem227nWl+d38zOebr6njj2yy+WwpQjfhmuGwN
	 162GqVYoybcnP0HxoWW4iQ91n1HZeT0XMCbm8CbNsqfawwexv5DSCNvvr8c+ypKUg7hhW
	 c/DVZ7kJ4qG+EdFXJL0GLOeucAgrI0zxK/LoLG8Bx5evsyTq4KTFevbtZHnhfxOQYNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794624989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=DXaSN0Fr6JcTZ0oBKaOBneCo8B26Hy879oIpVgJVCjY=;
	b=moOg+Vk5pWHQyX4mqcNdaV36PchNvQN0ZVS//fR26ZCGZsX9nKi0ZI/8IYu290rfz3m7
	 5m+ypJmLPnkpQFpXIOXsglzzHyHV+EvMPRonBJlZWQ8sXYM2ZhZFYirpQPCr9zaghISXR
	 KULGjy63YNzMBTa72XrMS/eydEjzi6MvseSVN4iddPdpYzhJ1pMjE2Su0lS6qNEQiOl6G
	 gTtAzgOj98MA+BjkR56Jb38ukuie/LxJTgtxW7JNuHEtkM6oqf70vy9IKIK+6UFimQVE5
	 1lmKhWn4Py76Z9+5JfewdXwd++PzasSKwfLci4nZdMa0ndr6EqMzweiEFNEJMRX9wzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F271ZPsA;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D77606A334
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47D77606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F271ZPsA
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b18717a193so911199a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794624988; x=1795229788; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DXaSN0Fr6JcTZ0oBKaOBneCo8B26Hy879oIpVgJVCjY=;
        b=F271ZPsASE2nn0cBwU2z3nrOqmEB7IsBi7VUB1XP8xsVs1T36Rk8uScTq9dzju/j/E
         YXOtKWlbcHaZNdCd0BfMqsL/3tjLyk4lBaT2dw88DFSDjqCLFo1dk12pvlC/rjzGJUxG
         YplTHJLUdUz2B+IRhFYAQG/ZFMPd4Zn50chZwuC1XSdivJus957D1HaVsTA9VnCHGa+a
         g1T4FbYIxG6Pd3ZXDO6162e95icEmczP6ScbJInpHqDxrBg3L9Npabsy6YF2r47EzQpi
         q/vhw2hSaAojeqc4ikfTVrF/WnvMFHXgrxB/f3rlSbbiJGyX1N1VChVS8GeqMMwwbvR9
         +csQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794624988; x=1795229788;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXaSN0Fr6JcTZ0oBKaOBneCo8B26Hy879oIpVgJVCjY=;
        b=pvJdQ6ErrH+R0pDN2xr06Wc0txMeC4nJiTcrTUqgYnBtbHei6aXlbEf52GTTwL7uyE
         hiwPPaQXXjKHIhxNd21pi1p4BIhMP9+/5xd4SX95H/AlLfyrjv3RD6xb26BwsV/exV+M
         y2WOU5pnpctZztwilizXlS7y7EErVfiFOP5tt5LCuK2rzoqEE3W+im4c5y98fDL7STWV
         n2JoT7GjpT2Qiss6MMRtrgisqwC/P1eS0bYVp2t/9xh8gt8MoillJQ+iZUDQXCdAwaMF
         RxSPiKfk2gsU97rT3twXrHUYEV/dSsLgqNdRMxDGCpkzwcY5LzrCo0CvCxspnkUGs5E/
         TB4A==
X-Forwarded-Encrypted: i=1; AL+hErGe3+n7ez7KpuBh4a67SYT8Yfl9d+ZpMQQwktm2KdEKALSwnt1KbaUMyVVfmxqFKhVObcPC8yQtemiBiHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dSrhliwfRls0qiwdYR5LFE9pEDnuI79u9bWasRKLSNW7pEUJ2
	hjV4/7CMMbAjLMU452O3t09rLY5I4D3XoL/YCT4+u0kzx694KGFKT/TC
X-Gm-Gg: AYBFou2Kn+eZy6IvvMY0Ejg2EWcur0IuVQHQN703IoHNAYO3Nf2vSOqG3fNB//EuOsU
	40h99DhkoLh6pBoxULEzvOyNBcfIlYNzgF66lKMd7cVqfpq2T+MS4J7yXSVLnYaI/jQ3V9e01OP
	3HMKRBbzdjAaKm6R3JXG70ppHsK1XepCRILghsfAZzf4jMOgrMQ+FAF192R8eHKzeAHK+nzplmB
	HtodEQ45nCHb7e39P800WUXRdRN0oR0IpPwdG6DexFxCNC6FfmsOQJQQZfxIW9eU1pEfbfI0+Di
	nUN1Q2ITcNjzWci3PeAe1S9E9YBpEsptqgrM3Qyw86h9l8NH2ZL+92AQZtVi6S5fJeSBR/UaxhM
	Z4mlDNIn9i8Xa3F3IGcJbr/FbTZuZxum4VIwBXukY/WEXK2WK/bOz2d2hEIsr5/8aLPqfxT1gSR
	3WHSRnYt1+sbTa7hXLv2tZ7zHWvBEB42Kc7ifUtnxgOvmeFPHChPLo0PBKJyYkDgNDxLRscsOKB
	nFhwBRQhvsYLOm8dg0rRJxEIEyyAoADqiilQnOByVb37BnSx14YdlZ9hwAdSmFpyffgU6vMOsWS
	/7tvCsY7jIf5OcFJM2e+nVn+9V7DCs7NDjbK+rcjfLSr0LLOSXhTXXpSFifrEdRWqS2hEBJ773R
	fWkJpZrcOJwrJ8o53joL33TSOZxBZKDWAi9dI11tlVrXNvT14qAvAKDk=
X-Received: by 2002:a17:90a:c784:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3b1b0a0e859mr3188105a91.10.1794624988299;
        Fri, 13 Nov 2026 18:56:28 -0800 (PST)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b25ebf34sm2758293a91.1.2026.11.13.18.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 18:56:27 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 02:56:26 +0000
Message-Id: <DMULGPH2RSTQ.19OTSZVNUXME4@gmail.com>
Cc: "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf] bpf: mask speculative out-of-bounds skb helper
 loads
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Daniel Trujillo" <datrujillo@nvidia.com>,
 =?utf-8?q?Dani=C3=ABl_Trujillo_via_B4_Relay?=
 <devnull+datrujillo.nvidia.com@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "John Fastabend"
 <john.fastabend@gmail.com>, "Stanislav Fomichev" <sdf@fomichev.me>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Simon Horman" <horms@kernel.org>
In-Reply-To: <PH7PR12MB879437C51235E3A3094EBCB9B27E2@PH7PR12MB8794.namprd12.prod.outlook.com>
References: <20261113-cbpf-ind-nospec-v1-bpf-v1-1-764ac4c14573@nvidia.com> <DMUHIJ5FC8EA.2XFM7TJ6AH0YB@gmail.com> <PH7PR12MB879437C51235E3A3094EBCB9B27E2@PH7PR12MB8794.namprd12.prod.outlook.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Nov 13, 2026 at 06:50 PM Daniel Trujillo <datrujillo@nvidia.com> wrote:
> With the instrumentation described in the commit message, the
> reproducer recovered the target bytes on the unpatched kernel. The same
> reproducer did not recover them on the patched kernel.

That instrumentation is a CLFLUSH added to the kernel in front of
the branch. Nobody runs such a kernel.
So it is theoretical.

Sorry, still wont-fix.
