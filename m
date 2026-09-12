Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0A23815F8;
	Sat, 12 Sep 2026 19:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789242878; cv=none; b=mC4x8h50ULwXlWIP0LpmMIRqx23QVPDSmv95PFASiKeqkI3rhMbcF7axmOSVbgiolPNe/RN0LT9t7onl/jW4KQEBCOn15BaEdx7vVPR+mfWcq6xwowf6dBqhzCfNBIQiZcUOfneoduXzTplAXMkPxtRv1hATvyUjfW/ZTO+4GXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789242878; c=relaxed/simple;
	bh=NlZZtnmo+KTEdQdJXckdXHVh0jG+BCt4tEgS6OMqtKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0z3Sb5vnFbXDbmpHvDrM4eFDLNT6aDXyiQnFoPdlSe1SR2l8aPnDAr/CXM3seihdw0D1sHI9qWKcmSbsOVLJoPt/8v7I8ihv4dR69h91Nc8lKfz17588SttAZHuSp5ndBs6YVGxLM88x6H+95RIFwvuOQxoZ5v7rgKBYk8Yn/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=eqsxUFXF; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="eqsxUFXF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1789242873; x=1789847673; i=deller@gmx.de;
	bh=gifgO5NS8cZI5qKfFaLsvMsKNwfU/pbN8UZ+TWP4okE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=eqsxUFXFPGInyRgCmHmCaoC7HtkLdhpmBTgKxHxNAB6fZqdJ0U5IKNrrkW7m1cQM
	 qwHyJ3EPa7pazyxvVOpShY1zmgsEOjdXCCfj2Ze25ozMe0tS3nMFEfu3Q957jL4ox
	 BMtEEI0UdxUPCjdZuiEE2AIRTPUneQQGNp3yESbfL3Gv6N6A9rOdand4HqanZjngB
	 A+Anzi1gCuBBph90FS/DwP2R/17z8B+KBi8JRbpsihtnkQoAdXJw2wkVQ8X3m+34T
	 //aRLorJvO3IvU2Vos7T62JNoF1eEILX5FlyWX+0COHRouNBIhdimcTav1HmDBhyN
	 3u0cTd7ep5+5lKgctg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwwZX-1wuhBC2vKl-014bZ8; Sat, 12
 Sep 2026 21:54:33 +0200
Message-ID: <576864d8-59e7-47e1-8ed9-83712b71dd84@gmx.de>
Date: Sat, 12 Sep 2026 21:54:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
References: <20260904121332.23565-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260904121332.23565-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QyR2kQMT/qov1Mwrx5vv1d5oXgQpgqnhvdnGI5a20KQJOY0Ku8L
 tiFIis+TkCrfB8KHR+el72w5CXhDOJKzXI67j1HfmwwjtDnhsvprmq5TpukFZW1jdTo/kYl
 LElqSM+M2WgIQI5qhUusK8KusrJP9evoaSe+yfxC93f96FdN+PLJAbJ5Z/icJobn4xMtBjw
 2P5jKHdEHp/tLCnm9a45g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Tr4kmyWaTqo=;31dPOWqPo4pSQs6aEe7GY/fQ+Bh
 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

On 9/4/26 14:13, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no cod=
e
> changes.
>=20
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>   arch/parisc/include/asm/pdcpat.h        | 4 ++--
>   arch/parisc/include/asm/special_insns.h | 2 +-
>   arch/parisc/include/uapi/asm/mman.h     | 2 +-
>   arch/parisc/kernel/perf_images.h        | 4 ++--
>   arch/parisc/lib/memcpy.c                | 2 +-
>   drivers/parisc/ccio-dma.c               | 2 +-
>   drivers/parisc/dino.c                   | 2 +-
>   drivers/parisc/pdc_stable.c             | 2 +-
>   drivers/parisc/sba_iommu.c              | 2 +-
>   drivers/parport/parport_gsc.c           | 2 +-
>   10 files changed, 12 insertions(+), 12 deletions(-)

I've splitted it up in smaller patches per driver and applied them.

Thanks!
Helge
