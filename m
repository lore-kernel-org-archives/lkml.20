Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915650;
	b=4Nd13b6tw9VF2kRrEKQrug25mes2bU+MtFWaELJSNhh1yZDN3ip4hFFOawUXYje6RUxO
	 WpOQIWilqOcVXJUClCRvKsPqELMEUMMsRgRI85BSX4nSQ6FrQkocot5z42nr+yfHoh0Uv
	 bQiJyVQTLD4LFRGuBLJiinOO7U6m4Bglvo13SK8cjExG3h4vpEMNkjojYPgfDjBAdJG72
	 DxWT6F5JRpry3ouf8CT8clCvtrxRqVpv0Q/cho+z/QP5WvVIveAM+rKBTWG8u+DyAo196
	 MrNr/nHW+ha0VOkLXsz0L+h3USWJhi02/vGeC2ny9IGoLknJCRLrk/luJ0t44isprPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915650;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wS1Hzm923FuQaQ3mJRDlA9hColzdiTa3bh8NOA9jRh8=;
	b=f7VF9ru3eEe0xTmrD6r45Jmp4aAVXAZfYkRo0KpPLwrZCDZMV/VvIjKQYCimNK/HykJ0
	 77qIipyq502mg9LaKYzzso4dWCDyyauhWfSyh9K4Y8DFEAS4BlDuqU2ZyaCdRQJNw/M/V
	 A22I6Z1XLL90Ek39i1rJkJQze0NP4zheOJU0oxthVxf4MoFb4r53rmW9uWrg1VC0F0mWU
	 QgqDR7PFIE7/0cSFUBQMY80LeekRBMhq5m/InnaxQiQr3YlwYWxP2Quww9XoEY9QlDV9e
	 UYUEmYzJ5pHZc/Getj5vcc/C6TAzmKHOq3bU23qveTrD2GciTY7rToIm8gXe/MbCnlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NTK3Zdzd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53558606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NTK3Zdzd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA3FE1F000C4;
	Tue, 17 Nov 2026 11:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794915649;
	bh=wS1Hzm923FuQaQ3mJRDlA9hColzdiTa3bh8NOA9jRh8=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=NTK3Zdzd4o+qPfuSxZTopEgjQZKW2k57Ge635tyzKGGdLWI/xGgqXQ10B2EjQP41k
	 FxgHk5iFUozKecZvh96pc1zwdApOAKBCI/rAspnTJPx+fem9nNvx2epmYgETnmtlkd
	 b1Y2IwcIp5wFXSdsxnjMx4vG25QhGXHzyjClvGJpvpKgq6MIxkkTmQxUSLs1ZkwfyT
	 q3jRQHOGkiQJiNMm9oGqFbpQdBjFpz9trQaqdLZynTrtWd+sFAxixa+SM+9wkAemBJ
	 iZQwzX8dGUDSbc5w8/08NGuo7dmWMyWmft3fJ/OsA0KNLxo1oAQhUojypnGpqTPlIT
	 2zYAtFcPbHrWg==
Message-ID: <5833f9d9-26b1-41c4-86bf-31b353ea41c1@kernel.org>
Date: Tue, 17 Nov 2026 19:40:47 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v2 16/20] f2fs: preserve inline data in subpage
 block mode
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261116040851.2849696-1-daeho43@gmail.com>
 <20261116040851.2849696-17-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261116040851.2849696-17-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 12:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> A write to an inline inode converted it to a regular inode whenever the
> folio held multiple blocks, allocating a block even for small files.
> Convert only when the write goes beyond MAX_INLINE_DATA; otherwise read
> the inline data into the folio and write it back to the inode block in
> f2fs_write_cache_folios(). This also applies to an inline inode that
> uses large folios when the block size equals PAGE_SIZE: its writeback
> now goes through f2fs_write_cache_folios() instead of
> f2fs_write_cache_pages().
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
