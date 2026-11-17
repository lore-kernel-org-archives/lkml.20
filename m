Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909741;
	b=L6G0I7Be4tVXaxEVmPNrVW0C/AGcpyLDxcGJ5akgZKgEHH6dQfbADj1BT+D8RkYIfvYf
	 VJ2SH9TEHWsP6jT3RWlMUdkke1ow8sQXvo5emwiLUr3RJM2Q+bZK00r8i+Ae2BgYV4y1m
	 3LyhxfwEbnK+fhkKofEtU1GfOS+hy7/OIYzuh70xzeQyrghzNFQR0g9l37l6L/aNF4u28
	 IcN6frQvTZLVDe7snk8l3oXRtbGU+fMThWCasQvvnnVgF3HEd3nm0WzeCbIv9kswQnLzq
	 N+iX81eSfLRBpa9UdDbTDchjbEVr3py3r7LWCbdLDuFgczB09SYtI9ZQqt7pDpG3erA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909741;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cLK3zzOfhn1NufegKdCfvj6yMMyKmfBzXnjhXdQX99w=;
	b=O7p+aI4ixWCP//s+WwCE0+MOwYrWg8/v1nqVSLWamXJ8lBhbiSxJ/VQ8h2gOzHuS9YCU
	 cQOZwu/2mS6nwtRV/P+vj4N6N0U19OS0ITS/B4FruYgo7RmUjiirX5Vk0RcrwgW3cCgYf
	 thoDS2FulsURlx99h+pCn9DCnpTXTEllYedUZMfJZpKMbfcnEiq0tf4IbGWggnVaT/5nz
	 ykcwMIXqT5wNEVi5HubFPnSrUssxcM9KEqtljJPf0ujGghQNXaCT1qgf0SFRWpc2A/WMn
	 GHJprEfn+15Q7u/4jjY5nw0TI73ZdoEaigsbauLlHtIzo3/ISBCJtFnCtYPMLFbissg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G7+BydlQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506B0606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G7+BydlQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98261F000C4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794909740;
	bh=cLK3zzOfhn1NufegKdCfvj6yMMyKmfBzXnjhXdQX99w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=G7+BydlQPSnynYkWinkxFM4YfGrecHX+svjDGOyD/KYsHRDXWX/yW470mlX45a2e8
	 EE93m/32G0w9nLRAOVet/9y1i/ogbpDK5FRRKre+YrcjvP1qAC3IvVUcMnr2FiobYx
	 ij8CeEiC49pZiNZOx66/cQrmdXKkxYzaplG4VWIxG5jUVBw88jljyvZ/YIhNAJDYH5
	 IlJ5BEKxfO1Jvd28VDvYv93KeLWZx30GRHIEefT8QPBE09bRD0/yceHtcGMQirLLEL
	 ENwfOMnzi1o67W+f7ssd7iyx6OhzdN24bGQ9tlTbTATSGYpdFUWj+BxIdpnN2RaqsS
	 Y9SJ9BmfObtAQ==
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ec6f271883so3931719e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:02:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEjD0IcKLM0FocAH345T2s3Kp/sS/cAyBvV8G2ztjocdCnlzbXRPX5hwV+6Xg+sRuAePO4EgKa4AEas0Q8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Vb4wkW+IBAxBxX3w0mrfzlG2M5VptRaM2MF5gSy8pJmYvUb1G
	9hs2m8IDVrWE79VhUK6nXDQnlIGuzZ1H8pComG2l6Q0dIe7JNjdKfW3/7ECFBi7mg89feP7YX2E
	mXkH57JBcTAbhTQerXOQ09VkV0bkcAqo=
X-Received: by 2002:a05:6122:8483:b0:5ee:3f2e:714c with SMTP id
 71dfb90a1353d-5ee3f2e76b1mr2651586e0c.4.1794909740230; Tue, 17 Nov 2026
 02:02:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-unused-sym-mm-v2-0-2f845e94dd50@amd.com> <20261117-unused-sym-mm-v2-2-2f845e94dd50@amd.com>
In-Reply-To: <20261117-unused-sym-mm-v2-2-2f845e94dd50@amd.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 17 Nov 2026 18:02:08 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4whmBuTeoEtKzfdYKXaBp-9Ph7+Oj6xCFUWY8en+p-q7Q@mail.gmail.com>
X-Gm-Features: Aa3M54ozWLhKg1KFQokUO3ZjKoGTiLL_NX7NP3uVe-gz0Ybf495Q6LaRkAtem0E
Message-ID: <CAGsJ_4whmBuTeoEtKzfdYKXaBp-9Ph7+Oj6xCFUWY8en+p-q7Q@mail.gmail.com>
Subject: Re: [PATCH mm-new v2 2/5] mm/swapops: remove unused make_guard_swp_entry()
To: Shivank Garg <shivankg@amd.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Youngjun Park <youngjun.park@lge.com>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 3:17=E2=80=AFPM Shivank Garg <shivankg@amd.com> wro=
te:
>
> make_guard_swp_entry() has no callers.
>
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---
>  include/linux/swapops.h | 5 -----
>  1 file changed, 5 deletions(-)
>

Reviewed-by: Barry Song <baohua@kernel.org>
