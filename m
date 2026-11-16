Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.77.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833262;
	b=SlweWD8Ihlecur+iGHm156Fy47dcLst8YgsbJ8FSq2v6z6HPBHuNGYKUs9jMBNeHCnJV
	 OYiF0VI3imp9/Qsyf73cPcVPAsB2YkrOqiLBVSxLl/CU7KnSfDIT1a+RNgggKhnZlPKrj
	 zwKC5CQGoOwIE8nK6Qfynt4O3SCY3soqkiSNnW+D3f7hIdJTLX44WtHyjX6h3sGnh3IQ0
	 gE7+iyKcZEcJM16oxLXk2j7L1dAbCHsbilv9cZib6ld6C/3o/V/M02aF0U5cU3D5buJUM
	 kYY0ipXIhu1Zs6is3gL2FyJK7sR/sPY4ei/N8N1Et8P0TfZk0GKGCeJUOoqt92ExHUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833262;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Info-Out:X-Proofpoint-GUID:
	 X-JNJ;
	bh=AqPO1svnj6cqsySztRzKc1k975aK5sT9hZbKLmraqes=;
	b=Z3uKv3oRalI53o2hzsJA85k44GWqtkl+NoX3UgrPe5oyYZW8C8vaVXKG7jC07K1jdFUN
	 9xAsR2GRr99DFFrH9pkluLBHtIlbc/9+iBrNnLzDL/8iGxGJXc7ItBouwDFPoNcezwTP5
	 8F4ox5cOVPsrOR9VU0XUeQp8sN/ZNBJ5eMA+4YxT+wWJwy0akiP/H3oMlKZae1VpRQaK5
	 hVmPGZXPvv5D1SWE5xO5XbBJ6gO2VjirxVP+lHNGXOvfS9ItO/6HEqL100GbPJRB02Bkq
	 6tt/T3ujC6zKAVVmQNNjWBKy+5+TvhV2tLeQNmvpKogvVfmAt4fgnp3bnO7bU5zYNGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=aJX5PoNC;
	arc=none smtp.remote-ip=57.103.77.182
Received: from outbound.st.icloud.com (st-2003l-snip4-1.eps.apple.com [57.103.77.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00485606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00485606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=aJX5PoNC
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-10-percent-2 (Postfix) with ESMTPS id 8E69C180064C;
	Mon, 16 Nov 2026 12:47:35 +0000 (UTC)
X-ICL-RepId: 01a1e466-0c3e-71a8-945f-4b8f3869dc17
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1794833261; x=1826369261; bh=AqPO1svnj6cqsySztRzKc1k975aK5sT9hZbKLmraqes=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=aJX5PoNCnUZDsPs6Wy9F/BXoQ7QKocVmQhEh1tHlv/DGYDztsZAKGDbDhZaiZKkjGfQGGU5H5OqURWQK16lbuANSbDQZmc7mCg1rJdTdcVPEQwivL2XpbCWZ88vfuyeRRmJjIMJxMh9HqIglhRQ6emejwx9K3ZjUSknL6cfG7A2SfKUwkIZrd4m9z/ZAcNQpo/S8E6mVMk5TnCsAt1qMBBNqzB6lGaX33thVBby3brzO63MktuwU33hgmq2nUQQn0zuD/SwGQOXCblpMx10zqMqMaQwrE7TIb0Ur9ugXTHYUysWyg1KXtjV0ZfDxTui30gUlsqVq1GSAumP/WrXbqA==
Received: from lima-kernel-dev (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-10-percent-2 (Postfix) with ESMTPSA id 6363B18002DF;
	Mon, 16 Nov 2026 12:47:29 +0000 (UTC)
Date: Mon, 16 Nov 2026 20:47:24 +0800
From: Zhang Peng <zippermonkey@icloud.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Zhang Peng <bruzzhang@tencent.com>
Subject: Re: [PATCH v6 0/5] mm: batch TLB flushing for dirty folios in vmscan
Message-ID: <avr7UOzToQYOppzN@lima-kernel-dev>
References: <20261031-batch-tlb-flush-v6-0-190539839eec@tencent.com>
 <8b89bd7d-8de3-408f-8f27-c0e4918e48f9@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b89bd7d-8de3-408f-8f27-c0e4918e48f9@kernel.org>
X-Proofpoint-ORIG-GUID: rL_ceMxMQoQrcYO9m8_ONcWMxu8lnufI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MCBTYWx0ZWRfX65TkCsqUYmNK
 hQ32UvJQfbCqlzdHFiJo0ComYWmOCClOw4chzSx92ium3md5fvPK7PqNfAh2+TbmwR61GULqxi8
 0g+tFWGNWWcCIqFBNja+GXrXSDgIGRSxMhjc20Quhua/87k9uzjOXW9I0ESgTg51pondADl0PYK
 iCxF6skFKyv7pcJLWJWz1gbcv/8FlzXnUJ7nX4T0Q5CdKbxjbmYerZc0NT681rWSfes5UVuSV9/
 vdjc8uGSNWTwj9pnXeWR0VEf7rGPQLuvTYkvKE1rEfwzRzqXrScBhBjg+91od8rRfei/WETFwxy
 XLbQZ1+ns4NduH7Nuuk6JdWFnoMsepjRDRJ+9Uj7QA3AvXIFwohz2xX6xv73MQ=
X-Authority-Info-Out: v=2.4 cv=CJonnBrD c=1 sm=1 tr=0 ts=6afafb6b
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10
 a=x7bEGLp0ZPQA:10 a=YE32fvk_ji8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=-UxxG35tPzvqjwnQO_AA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: rL_ceMxMQoQrcYO9m8_ONcWMxu8lnufI
X-JNJ: AAAAAAABJG4OMtSERyiWZZXizsbRvBXCI28NnBcbk58Polj8fd/41R7pO1zJJ2Tykwec8h
 Xq4wQw//8H5xM/8wLsgiaXq3PZPV/l65LUcHbV6GZTjy7IRGgu1OzrGEQ8gUBLBgwfA9e2
 JujTZK5cych6aB/GbbiEmyaHnQ8pSUayaJmvYjZdOF8LwXLhOrgDoHKCYaWr1o711h9DG+
 YD6FFenD0LvvhpNMpa7aqZsc4Tm01CH7Vv6GFWua5/gWk8EKT8aqmAgOy17thiWWXjw8KO
 F6jeughSjZC7UH68D7y79DLxucghGwtYaHU1UTmROOrB461zQj3oX4nNn9yRUIck+H2fUv
 WGVCMcqL1h0IDZyepoGHSWrm57jAK4CfHO0WCJJ8AfU2Nc8zuWnOpGDdV2X+Zuiox418p+
 a8in0MXzA39O1vdTch2k/GGrThGWly4S7jo/ZKDy+Q1JQbZ+pN5Oomj26A+iXkfXlu620n
 15GZ0rltjFAtvVBW/1nXn+4u1QJ5g0apsdQiNV0dPN8+CrjI9vYwm4HM7bb02W1uaWqcWV
 reCnw+zdAzKLPrsczzdoKmDxWBM07mi12N2hORLu+5eSt59mlmqHVKW5ZZjAFh7EgBUt3I
 mujZdddCIrwA2k0cJojCOzDBEK9RMhXPWrGxN5C6LMQuUbALqAzVtk6TQ0IY4iguObiO5L
 x2PNCNzta/XHa4PqZmnxsedpAVQzDjCQ4Qp5FyQgKpZ+TrkGT5zMQ3k/CgL3CiJeRw/5qx
 z+cuvss5pdnUlQ6n66emywLygqffuieTTHb/kNyg9UyGejupMaPfD/Ct378WodANZkQPl3
 qTgDX0ErEaPXy/s4nuo8c7RxFmz4l72lwl4RnX8i+qETu4Hy3SuIKaICLG+IzOelrFmz4o
 6oDJS7o3umPzexI/Qf72iatX5pkja8cCwfWff/b+6166VhwYmKidshRnrU4qL95kCJALUs
 Hsi6kEtyZ49fgfvxA2nqW0GU8wjfOfudkiAEKpvd6tL5bP389xBxKancX6KUM2VfCkwKEO
 Yt9Xap54Sd63Vy2ZeSus0ma8izjlRQjpelT7jlcVvWSacGM1kaJvnZ2qNAFqsfrXImBiXs
 boHeWj8Vki8WVwAtYKEYoqKUx1l81qYvJ1bSuzZQ4nnSa13jQ5AG5PZe8I+NgmpkrRfZEz
 JZIOUepD0+IuCY6KcrmCIybuFGqaf11M2CWpvP2xpoUrmeJELleN9huS3LPY48XyHruVVF
 mdRkkCq3YOOCQjOqeYSu+0TJnjhMGsroTOPJbToa+/vooaMFfahAyO/4pCLkg2/rWCOTAz
 EzZBpLndUqrvIinA49SYTg5Q1FSRPqaEArbqVFNvqjUMY4Vaqz+ptCxw7gpntToi4mdM6v
 aDhz0dt3TSOTBB/mGoDmdNFnX8jkZikDiAoEAiF8KkJzzaMfVj27TRH0Ad2BTOxLsYGUds
 8gflFaHYJ96AK/yTzhffYybgYJC/YB5iMUY4IV

On Mon, Nov 16, 2026 at 01:10:22PM +0100, David Hildenbrand (Arm) wrote:
> On 10/31/26 11:35, Zhang Peng wrote:
> > This series introduces batch TLB flushing optimization for dirty folios
> > during memory reclaim, aiming to reduce IPI overhead on multi-core systems.
> > 
> > Background
> > ----------
> > Reclaim calls try_to_unmap_flush_dirty() before writing out each dirty
> > folio. When writable TLB entries are pending, this triggers a flush.
> > On systems that use IPIs for TLB shootdowns, frequent flushes can add
> > significant overhead.
> > 
> 
> I will send out a series soon that fixes various issues with current delayed TLB
> flushing.
> 
> It's all such a mess.
> 
> There will be one issue that is harder to resolve, which will interact with your
> changes.
> 
> I think something along the lines of your approach might come in handy to
> resolve it. I'll CC you once I send it out and we can discuss there.
> 
> -- 
> Cheers,
> 
> David
Thanks for the heads-up. I'll take a look at your series once it's posted,
and I'd be happy to discuss how this approach might help.

Thanks,
Zhang Peng
