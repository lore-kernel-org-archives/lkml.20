Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.25.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505650;
	b=lT+Ibc/SLUXnGy4tnCcnNl4l1SZEfdWapsu/pwoNTUVooYlb4DqiNV5JGGQkg0cHJiOn
	 HmOeHoVLOsp5sHW2gm26UiKngu8fjg+wHWBDho7kJpj0BrL/+gNMDDiJ0GjUjVimyGjxF
	 L594EWrwPLuJv6DVSm4lc1E4sIKzJPt6MYKM6asFNqCANMPRcqwG3hdeloaU97939bUxk
	 dVeUE+pCqn/hkDmMsTfwoL9jQPaBTdzjKql/9oaVqihK2U+/+u2jPmzTCByJz2DawbIs3
	 DNHK3TdDdN1KurXcEn6++87Xo5+DD4MEeNsNNi2Womtpr9wfOHhVLEQnfWqqV7JVVvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505650;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Infomaniak-Routing;
	bh=we9TziTBtw3Fo+dRvY9d2iSIdR3WTXnm7XJpz1tL/vg=;
	b=WwhZMTlNwUbCsiK+5f06S8LmnvsHRB1x8vAuBW1zqFIzBx1XYLbfssbrc4ZCxqT3HsMD
	 QJQI0/SZXtim8xc0d3F84zNOCaUhV1qO5cZfpqKbDmtxCt24PiKuHp4M/gfwDVr30nVdR
	 2uJl4fcl9FSsrATskK4YNoS6vUOnOFyseMjLr+JnVCUTOkXWs5SaFOQA3uCl+bS8JNgT+
	 LnmbaqZhYGJ7OmkT+ulo26RXENwTixFBNb701Pg7tshNh7wsfYxhO0e6QuK5G6pVU2Yro
	 92RifPuRYtvbT+MVaNuyLdQfeSlbPNoeyt/OfxsibgnTQ73x/ElsA1/ropXfKKFkzYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=ZVXaiuve;
	arc=none smtp.remote-ip=185.125.25.8
Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch [185.125.25.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E0A606AA2E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47E0A606AA2E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=ZVXaiuve
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4j8DtK0FjGzRln;
	Tue, 20 Oct 2026 16:14:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1792505640;
	bh=we9TziTBtw3Fo+dRvY9d2iSIdR3WTXnm7XJpz1tL/vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZVXaiuvesrknEesQAsvSZCkKb1XsuSeyUorpq57VMwtH5k/pyQxtcTSuV3RG3RJv8
	 RoL3z3PtAiYnfOe/I6BgHeMfBjVtyTq0sIkxHEQSNu8auWLSxdQe0hoUv3GcRFQIEi
	 HcoQAg9xAsIQIfZutDkgc6d2NBtium7j7ClZXOoA=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4j8DtJ1v6dzQZ6;
	Tue, 20 Oct 2026 16:14:00 +0200 (CEST)
Date: Tue, 20 Oct 2026 16:13:56 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Paul Moore <paul@paul-moore.com>, 
	Christian Brauner <brauner@kernel.org>
Subject: Re: linux-next: manual merge of the landlock tree with the security
 tree
Message-ID: <20261020.eethaeluo6eK@digikod.net>
References: <atdvaWI6T-HXhtix@sirena.co.uk>
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
In-Reply-To: <atdvaWI6T-HXhtix@sirena.co.uk>
X-Infomaniak-Routing: alpha

On Tue, Oct 20, 2026 at 02:40:57PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the landlock tree got a conflict in:
> 
>   include/linux/ns/ns_common_types.h
> 
> between commit:
> 
>   436485132d236 ("Automated merge of 'lsm/dev' into 'stable-7.4'")

I cannot find this commit, is it a new one from linux-next?

I had to create a merge commit because the LSM next branch is too old,
so I followed the previous merge resolution from linux-next, but it
looks like today's merge commit is different than the previous ones.

> 
> from the security tree and commit:
> 
>   0cbc5a0d65b05 ("Merge branch 'lsm/dev' into master")
> 
> from the landlock tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --combined include/linux/ns/ns_common_types.h
> index 47a5cfe2326a3,fddc62be3b626..0000000000000
> --- a/include/linux/ns/ns_common_types.h
> +++ b/include/linux/ns/ns_common_types.h
> @@@ -116,11 -116,11 +116,11 @@@ struct ns_common 
>   	struct dentry *stashed;
>   	const struct proc_ns_operations *ops;
>   	unsigned int inum;
>  -	struct ns_tree;
>  -	struct rcu_head ns_rcu;
>   #ifdef CONFIG_SECURITY
>   	void *ns_security;
>   #endif
>  +	struct ns_tree;
>  +	struct rcu_head ns_rcu;

The previous merge (from yesterday and before [1]) was moving the
ns_security at the end of the struct but this new merge commit moves it
before the ns_tree field.  Do you know why?

[1] b6926a7ca6e5 ("Merge branch 'next' of
https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git")

>   };
>   
>   #define to_ns_common(__ns)                                    \


