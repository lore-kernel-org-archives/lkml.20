Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423299;
	b=ewGa7tRQNovKdeu31dtlyy8xcaPKhp/Gjhwvst+s9lJ1th9o4beBYEhyFpeEaW891/F/
	 iZttxmKCIfb63n7/g60/s8Y81md6lReb+iTAvVpUxjj8GplQ9Ok0b8KGAXpr33CqG9aUE
	 ROU3GGAq4w3qhI4YLn1H/dXrB8MkxLuECu8HR7ADF6XNIOIsAMuSQJzfJv020H0jHYE3Y
	 2hl5tldabOiqA6r52MOfu6az9eRDPg4agRVv7wL2QDcHLnrphNWN2aKWzFfTPwKFjQZhS
	 faNcWtiECblxk+pAa22VL1OWgKfMMAZrE6qfjFMSb+65ITJvIlH1uV+0BaUkqwPej5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423299;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=YwaKnHbySTdduqYIAo0uIt5iSJ/S/CGViQ8hARGAuYE=;
	b=CUaqvzsZ9SzcSaM1/G/SVqcHsaavDlVF6hRR6JRVYlQi5AivqrWWC30Pns/F6gclvpZA
	 t0Uwpr5W/qu3Hd/FWI98u3YkfK+hv2/DIxsn6mS7DXZICR30oSTsZUjLjMdVEi01wwNiV
	 pBNnyuR9Fjb9W1L570QwJosfKtuZxGYGlW+GNZlDBDRJOxjs5PNohS2c0TCEVd2dpwCSn
	 lrRYwDf8tNRlFYLZ3x9gOdlYQveF5P2W+lHSCjZG1DtTUzUD5wM1kvW3Ch8V2CROnjJC9
	 /JHQAq9AZjWgK7Qd2oYdeQI0pbLwuS7wXLWbon8cmg+5Ja7luZV4hpthA7jbJXfyGTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lv7dncuT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324C060A8F5C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lv7dncuT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412731F000C5;
	Mon, 19 Oct 2026 15:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792423298;
	bh=YwaKnHbySTdduqYIAo0uIt5iSJ/S/CGViQ8hARGAuYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lv7dncuT0A5cXTc4DnHQrJuxWL83mt/CqJrazSkUg5smuYKcwpLRehvvxY/Uc2PA2
	 WqQ8y8v6iCcmmS0kJP4dAA23IEvgneEX5LT43jLujLj80VxuE4JVDTYj/NIF3N/a9r
	 l+mk16TPti32HCMeMg25qG47ug4GbJ9J618E2u1BdhfM9xRWUXCydQrXdYzyp/mnoT
	 IEECHdqharsOcA8fBv2/BOBOtluIOX4dSYB4LpebwhdvOjvKgNrHn/GUSa7dAaaX7Z
	 y3NHvXd2opjA9+I9Sh55q2qrXV9dumn/NbB1qFCMGrRO5nsp1867QDKNt5yVSvyhl0
	 MMhO4FrQfOh+g==
Date: Mon, 19 Oct 2026 15:21:36 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Nanzhe Zhao <nzzhao@126.com>
Cc: Nanzhe Zhao <nzzhao.sigma@gmail.com>, Barry Song <baohua@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Subject: Re: [f2fs-dev] [PATCH v5 00/16] f2fs: support & optimize large
 folios for writable files
Message-ID: <atY1gNfX9Lhg3zC6@google.com>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
 <atAO6ykqwGgZq77y@google.com>
 <atA24UMtAqkmz_R8@google.com>
 <63e416aa.2fb2.1a13d9f3491.Coremail.nzzhao@126.com>
 <atD9Csw1-lj5_SR_@google.com>
 <atFFXafuVyyimmUk@google.com>
 <15373a26.1e3d.1a1494e8d1a.Coremail.nzzhao@126.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15373a26.1e3d.1a1494e8d1a.Coremail.nzzhao@126.com>

On 10/17, Nanzhe Zhao wrote:
> 
> 
> 
> Hi Jaeguk,
>   
>   I am trying to reproduce the failure in your log: sd 0:0:0:4: Retrying unaligned write for zone 2639 → critical target error → sde:
>   zone 2639: Aborting plugged BIOs → f2fs_stop_checkpoint (kernel 6.12.81-android16-6) and got two two questions.
>   
>   1. Kernel baseline. Could you confirm that the kernel you tested has Bart Van Assche's zoned write pipelining, i.e. multiple in-flight
>   sequential writes per zone, with the order kept by BLK_FEAT_ORDERED_HWQ and the per-zone from_cpu in block/blk-zoned.c? And that it
>   does not include these three follow-up fixes:
>   
>   - "ANDROID: block: Preserve the submission order of zoned writes"
>   - "ANDROID: block: Preserve the order of zoned REQ_FUA writes"
>   - "ANDROID: block: Restore the write pointer offset check"
>   
>   In AOSP they are 050de570f, c616f7c1a, d50601d0f on android16-6.12, and 6068ed9f0, d786f8609, f08430f80 on android17-6.18. The
>   simplest check is whether REQ_ZONE_SERIALIZED and work_busy(&zwplug->bio_work) appear in your block/blk-zoned.c. The output of git log
>   --oneline -- block/blk-zoned.c would also do.

I'm testing on android16-6.12 where it has all Bart's previous patches.

>   
>   2. Test workload. If that is the case, could you share the test workload that triggers it?  So far I have not been able to reproduce it using null_blk to simulate 
> zone devices with qemu and android17-6.18 gki kernel. Any suggestions would be much appreciated.

I'm testing the kernel on my primary phone. After applying the latest ones
again, I haven't hit the panic yet. So, could you please send v6? Then, I'll
reapply all and keep testing.

> Thanks,
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
