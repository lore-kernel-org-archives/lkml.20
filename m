Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E313BF67A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082630; cv=none; b=LtWn2wNGPtH4SnSDIyyQkQKV9l4uqS/V9cElxW+2Wd6kBLXYMVD6XO7jVNm6NQINDMDhofD54jNVNBYs9J6emJV19ml6N/szeGbTAFUuHNK6v5KJscnOXehfKshL+0H8YAb3FBb1MkyfcbeBUbgPmcVETRiYvAIh+q25Md2toZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082630; c=relaxed/simple;
	bh=xGc34cYFgl9gRuxC2uMg/rn1/epk4i2vSKizLYO+Dtg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Z8fKbjmmwW0wCHKeZm9236mZtQ8Fx+oZYCdRvdFEayc1nRilFGnaRwIsSMduYaiEqHxBys18iTtmCAHHc8FGauirsX9u7gIXBWJFcZ0xTZJz14B23mq7nLg+qiFBXaiWkrrfmYRh0pDsAq2wSxkhvrOPNCIlpDOFIqCQpQELyoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e8vWtRUL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e8vWtRUL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FA91F000FF;
	Tue, 22 Sep 2026 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790082629;
	bh=B2Vaf3G4Jok7VPkAXcd4FFg4UAebg/qxdoTcZSkkoh4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=e8vWtRULzBO1yoXStZEYYHOjHRW4kFZf+lhOMGT0/ibtLG25A1M0hsQFvF2FFodfA
	 2fl2UBGp5ukz63MiD6pVako2fCRtpHnelJX9naWtqkqeyo3QiiqBru1oOWReHgWUKv
	 rlHgZfnre+vEreg2Rz3GmmgE1UrGR0E/E2+A801Kh9oyr7xlNNZ3TpTm4HA9J2KOgv
	 i/LVYmAmYEEvKYgjf5P0ziy7g48pdtBMYEhizu+EjyXTMmRvfra/Zo16KZvadJtEEj
	 OhTMOzpzs6aqw5UH32FRDdQycbWpkrj2amVpLgrSgVGqBysV6WrtKJlLdZUlgefsWP
	 cAYLlWDcbfDPg==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 17FB5F40066;
	Tue, 22 Sep 2026 09:10:28 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Tue, 22 Sep 2026 09:10:28 -0400
X-ME-Sender: <xms:RH6yauRrdXx7q6flTQj32MnXiaeyiRLt05HudjL4sjNK76sX5uGGIA>
    <xme:RH6yaumbrIYD6sgw9--3AGJnJjtyc9iRUb82chwLaCLDgRBT-MUlIlyx2Z2cQj7cW
    Bc6k1qIzzm9XJPgxKIuyOG5-VMyP4JsvNe5TQ4T08IjVs-UsF9czUrW>
X-ME-Proxy-Cause: dmFkZTFyiJaG6SoLVKZ8p2R8v3wal9uiFWfR69j7sUoehaJbFxTTMsPQoqdrMWsTZJZ68Y
    6VHQgiOvEzXqy2EypyHjHQgrg2+0cwHY9G5EhwACfy/0K3rmdchYT6+NbZZDS1fsF+dkG3
    EWmj+etjMmJTPNEWkpO5he4cBU0Lh9HnjfvxLzymVi+OFxgxjF313LWneFBQK8qDvTZfkQ
    ip7fb4dJ5RUQCWpd0smd8d3xOc9EytnYdpyeTO7dhebjl9QwKIcQ26GNZNiRHe92s18zxr
    ud3qWxYIt3+RjJ/NAHnBdAVeewvgcxyW53d3xXmnbs03MotClWhcrNaxsrLgkBODWN3gEs
    HWpoecM4rLrrzRtSgJOsDPTnoqxMs/tWqWGSfUGfyveYSR1IjI0k4bkFpgGx/vOtALhv8I
    O7e70wkAi5FGEFEJgCDbJmZBcAEheK+oyzn5ONnqSQORHV4m3X8ayZBegv7iwA18JshVRL
    eqXtGKrcC/o4HEGxWjKJmWod+1RePvs5drQEmcOtRzYvlB6OoJP0VlcihRWlkmhvoH7X9t
    7HpYP/sLWEIZjcTQaA8wmJh0280iS3v2bOabb4jSPB+1hWqYao5tlxtXGFDAdMPCZpt49c
    cpeYdDglDW+go+z1b+pqx4T+HzhsEm/V9dl7OfDzkzLHdIYOiNR3KMH0PixA
X-ME-Proxy: <xmx:RH6yapcJMOJ-IejYu949sONhEGqvN41xTNr_OLVmnOn39tPmYJsFEg>
    <xmx:RH6yagIZQkQwEtPM3aaJCbY2tmYaVqHTh9xjoqGFWGdw40GlsoJn8Q>
    <xmx:RH6yauG5rZIy4LqvtC_Akki4ERh2PgyBhum8LBlJloVerufUXQI_bA>
    <xmx:RH6yajCM1fldHz1CHbTbgYCzRDl_2LLxi7mk4LUi6X0i1bnfOvPc8A>
    <xmx:RH6yah8r42D4vo4NPzuHk_OFoj1lZCzIHnFuw1OSwKWRn9wc93Rys8o5>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E9BE7780075; Tue, 22 Sep 2026 09:10:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Axnhf21sy6mB
Date: Tue, 22 Sep 2026 09:09:57 -0400
From: "Chuck Lever" <cel@kernel.org>
To: "Mark Brown" <broonie@kernel.org>, "Chuck Lever" <chuck.lever@oracle.com>
Cc: "Anna Schumaker" <anna.schumaker@hammerspace.com>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Linux Next" <linux-next@vger.kernel.org>
Message-Id: <c2820c5b-94c4-4b30-a6e1-cc7e49210d0d@app.fastmail.com>
In-Reply-To: <arI_XvccOKuOsjzo@sirena.co.uk>
References: <arI_XvccOKuOsjzo@sirena.co.uk>
Subject: Re: linux-next: manual merge of the nfsd tree with the nfs-anna tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Tue, Sep 22, 2026, at 4:42 AM, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the nfsd tree got a conflict in:
>
>   net/sunrpc/svcsock.c
>
> between commits:
>
>   2ecf0d2af5da8 ("SUNRPC: resume receiving after a TLS control record")
>   1a485d8e93a92 ("SUNRPC: treat every TLS error alert as fatal")
>   d3b4fb1d30749 ("SUNRPC: reject a TLS alert record that is not two 
> octets")
>   f547743e6b51f ("SUNRPC: do not credit control-record octets to the 
> RPC stream")
>
> from the nfs-anna tree and commits:
>
>   a76d52a01792f ("SUNRPC: Do not credit control-record octets to the 
> RPC stream")
>   e263b5d674fcf ("SUNRPC: Reject a TLS alert record that is not two 
> octets")
>   ebcbe4a9a7779 ("SUNRPC: Treat every TLS error alert as fatal")
>   8f765d820c590 ("SUNRPC: Resume receiving after a TLS control record")
>   7f757c41a8beb ("SUNRPC: Reject a socket that already has an svc_sock 
> attached")
>   35ab7140c7bfa ("SUNRPC: Separate the TLS control-record receive from 
> its policy")
>   9a4ef884d00cd ("SUNRPC: Close the transport on an unhandled TLS 
> record type")
>   eaef7075c6a48 ("SUNRPC: Flush a received record's pages once it is 
> complete")
>   1517c61f247f3 ("SUNRPC: Receive RPC records with ->read_sock")
>   23bec0f9631c2 ("SUNRPC: Bypass sock_recvmsg() for the TLS 
> control-record receive")
>   0fce57f554fa6 ("SUNRPC: Skip xpt_reserved accounting for non-UDP 
> transports")
>
> from the nfsd tree.  This looks like different versions of patches being
> applied with extra stuff then stacked on top.  I've taken the nfsd
> version but it's possible that's gone wrong, I'm not *super* confident
> in this.  It feels like there's a coordination issue here.

I didn't realize Anna had picked up the TLS-related work. To resolve
these conflicts:

- I can drop the xprtsock.c three (91bdf2ae4a27, 6b91817001fb,
  21bcc6ccc6cd) from nfsd-next

- I need to keep the svcsock.c four, as there is follow-on work in
  the NFSD queue that depends on those

Anna, can you drop f547743e6b51, d3b4fb1d3074, 1a485d8e93a9,
2ecf0d2af5da from nfs-anna?


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
