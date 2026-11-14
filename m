Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794628156;
	b=M3XAOnNUk1EnCIzAEu9TnzdypGny4nc3Eo/XiqLjas+6UJNV36qtFqnameNepQKzO4+G
	 HqsCDAOPrsNNejX7QeyjubFd4thwpAxZWPbVFYwPYgTSIbS+1uia0a1gFS4zGUnlE+7hz
	 z9MWsNdDLwxUbQpKuDAOSL/k89AWxFzD86RKjset+WXmAurtuZdxqh7b8f8/eb0wfEHqp
	 9DLSpAN2HUX2FD33upCMD7P6CjFhP9BVSxg61lhAqkewFHPV4A25HwTHv8dYfbmu7LICi
	 Z5R9UMjFW3CIAffBzsDm5MyIMyCUjpoPBO6YzjFZSCWvlt/nj+8tiq22Xju1MbQcFsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794628156;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0b59adfUXcCN3wSBfFMT7H0c9qJxsM9ogsFUZRSyVV0=;
	b=xSEs7joqyoDl+k0+jDE+THmOdi9BUvhQ4SXM5pr4kiUXoeTC9S5VSw0TVcgE9mZNr4HH
	 H7j/K4nUGxOwUhQI5W3VVac/PhXdfLgLAw/xF1zKQRZApAOlLPOJtmBgED0bH/kw4yofC
	 7oD1J5OeZpDnvjYHzKunbeRM7dZ4bSTEyfsW3DI3tRt5o3fmeQGPGvEBCd8TkqmzDlhJQ
	 9TAMhO9ncI3oVlItH87yIIz+xkpgbm1nd9bZ//PbayvOzGPQuT3dmhRO4iJ1xLSdQNxY+
	 MiQrKLLkgN8u6VLQwXBgKoYgrmhARZmYKrEuLMUlcB+um5dmtcZ0ydZKg76j8a/3p8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=j3PsSLGz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565CD606A32E;
	Sat, 14 Nov 2026 03:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=j3PsSLGz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629B41F000C4;
	Sat, 14 Nov 2026 03:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794628156;
	bh=0b59adfUXcCN3wSBfFMT7H0c9qJxsM9ogsFUZRSyVV0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=j3PsSLGzd8fW7PhknUz96G1hGqtN2INgIwTbbzWzCLN5z49ePIxPYlo9gV4zs25+F
	 86BvW0DZLTwKGUFPdimiWbVnZoyZk434O/xWFPjBabQs4j/+vX71nFAR6rtkRWpSot
	 Z5zParPDlsSJrGboMOt/rd++Rav62Keh7K1yKVMo=
Date: Fri, 13 Nov 2026 19:49:15 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Joe Perches <joe@perches.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, users@kernel.org,
 Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa
 <akiyks@gmail.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik
 <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh
 <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, Petr Pavlu
 <petr.pavlu@suse.com>
Subject: Re: [PATCH v3 0/2] get_maintainer: stop sending every patch to LKML
Message-Id: <20261113194915.a48a1a3778464348773dffd4@linux-foundation.org>
In-Reply-To: <0825b89ca1dfe1ff20090d6dfdbb725b3f471d65.camel@perches.com>
References: <20261113-get-maintainer-the-rest-fallback-v3-0-36ee5a3e8d13@linuxfoundation.org>
	<0825b89ca1dfe1ff20090d6dfdbb725b3f471d65.camel@perches.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Nov 2026 18:59:50 -0800 Joe Perches <joe@perches.com> wrote:

> On Fri, 2026-11-13 at 18:02 -0500, Konstantin Ryabitsev wrote:
> > LKML has become mostly a firehose of patches that are already going to a
> > subsystem list. The reason is THE REST: it matches every file in the
> > tree, so get_maintainer.pl adds linux-kernel@vger.kernel.org to every
> > single patch. During the week of Oct 1-7, 2026:
> 
> Andrew can you please get this upstream?

Sure, added to mm.git's 7.4-rcX hotfixes queue, thanks.


