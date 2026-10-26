Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793046434;
	b=0f7Y99vbT9HjjZHqKetSxSQONyXS79ldauPrwtmrC4CdPqtYWPAUvpw/sVnmJ1KtDchw
	 xIW9xluG7xPK9VhdLUzFADt1emRkcwVRw+8FbnzxNEccXhADExCinxHaehQhCu541Lqqs
	 vXCB18J5Qr+1ymLNkp/aGdPVn/x9Na+n7rI1JavtRqG+mjX0SsH7zScxovMDU5nv4wLl2
	 OdWzel9dGdR75svyhiLyLnd2t8x5+WxqSx/Kv1bizl8R6pvCnx905kusaXjPPHss52R3S
	 c/b3nYtc+GYThHu6wUmvoWPFBCcN262GralTQG1ov2EGEx65Stu1cBED9Aa4wU/nMiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046434;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:To:Cc:References:Subject:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=0rFainJhqdviEgXERCkuAXMBJIMk47qPeO7jf0mjJHI=;
	b=Z6duEwnE/4VsnEL1potRV0Kycok7jypxquHCttyn+NvdmcYB+Q1iEQHizkOZ3IGze+FV
	 j0Duu0iTeOZ9TrlTb0DX8qaG/hKOm4w4Zq8IWNqiFf5eyWen7qnGntFSe0DraKrdpjZr5
	 2H8CzOYci9JvhWq0WV7kvuQBgHLhLSzZVku8dnsR6eFkcD/OOUxWXO+rqTntMNAgEb954
	 O1U2JFaKlncYX6q9m6egQzgXNxCH+SifllkfeBvSXm7ADJimN2Z7r+lpuMWecgceW8s2w
	 0PLn4R0axDuaqWg7aFF/Q/fb8SlPFajryNgbEtDWVLbyM8XzMBVnsG7H03fPMKSFDlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=dHiZ3yZq;
	arc=none smtp.remote-ip=212.227.15.4
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A650606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A650606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=dHiZ3yZq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1793046431; x=1793651231; i=markus.elfring@web.de;
	bh=0rFainJhqdviEgXERCkuAXMBJIMk47qPeO7jf0mjJHI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=dHiZ3yZqDAa19vj3jaF0D5IbhHS3fWz1nI+cKV09cRiC/2V/RbmvzsB8DQWuQrlM
	 5eZojsQ1kR/p/7X4tFh+Wdj1+og7ghN4Ti+7B5wh9JPyvSEtgKIPZieC0gmi0a+f/
	 njX3pU031x4VyMPrNhaftt0Nm+GfSjWAdjrTWgwtWSpQZr8f1KtkxrXTkiXNWAEW8
	 tT87iCWo0ubz5jtZn6ExhLgfggKMaMg1eOjCQUawLepVH1eyCxPyJEIjQ4Kh65u1O
	 88SWRSgDZ3BwgOqpMn3RVRvISBaZ+tGGrKyi7DUaUOK2RySLYIeTWFQMFLql92VbN
	 Uwm88kh666B8/3ttzg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MeUbo-1wl00I3yRY-00pJfE; Mon, 26
 Oct 2026 21:27:11 +0100
Message-ID: <ed315ff8-36fa-40ef-90f9-01ad197a9f94@web.de>
Date: Mon, 26 Oct 2026 21:27:09 +0100
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
To: Bart Van Assche <bvanassche@acm.org>, linuxppc-dev@lists.ozlabs.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Christophe Leroy
 <chleroy@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
References: <56f0c45723ee53149a21ceb599010e957457afd8.1793044370.git.bvanassche@acm.org>
Subject: Re: [PATCH] powerpc/iommu: Fix an RCU read lock leak in
 mm_iommu_is_devmem()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <56f0c45723ee53149a21ceb599010e957457afd8.1793044370.git.bvanassche@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qTKgH57TOzyJ5nr5xKKTUtBr2l4rXHfZPZF2pcEZTRYDGjUdxlE
 BXKBRZAupAc5mNFpzrNkQk4aPUteBJORH/mhRrE1xIfiCAtTd/t05frACCZSAvljB6j5gAX
 zzYVZL75Ky5DJ5rH/xANUr2d0XackBiXZ6JjyibDi9pwI4JFSlZE4E04IRjGlWYqYIdCmXh
 DdnCCfrCF5/8vFgeBWIjw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rPocoWF5R/8=;SuDjSbQw5iSaPim4M/rBY0kW85S
 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
 rzO5VwrQi3nHl/jd7mRCPNq8I/ug==

=E2=80=A6
> +++ b/arch/powerpc/mm/book3s64/iommu_api.c
> @@ -371,6 +371,7 @@ bool mm_iommu_is_devmem(struct mm_struct *mm, unsign=
ed long hpa,
>  			 * and the caller needs to distinguish this situation.
>  			 */
>  			*size =3D min(1UL << pageshift, end - hpa);
> +			rcu_read_unlock();
>  			return true;
>  		}
>  	}

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(rcu)();=E2=80=9D?
https://elixir.bootlin.com/linux/v7.3/source/include/linux/rcupdate.h#L121=
6

Regards,
Markus
