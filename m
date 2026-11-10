Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335252;
	b=bFj42gFa7D0gKYb05Q7bSz7QElWi1VkK7NmsLdHquu9KjnZ3UCWoUSMcMbT5Z3r4uVuK
	 8c8JkznnzQawDrb1eRl8oGiJNgF7cJ3es8nUHcQX4G5soydf8HabJf8To5cE0C2r5J4a2
	 xYN1qqOIEkUuT0l02Xte7ylV/O7wbq1jh4/wZa155sjrdahxdh2rEF2Gq39lD1IcGnQau
	 iWFnynFmcwoAX2vXvU7zIggN5w324Ox1ikznwsQeuR7ezF8gk9VRPhMYPIZ8mQwqD377i
	 NgeJhvVPwvLIWk/QZCqjJ0gK2quN/dnYwYi/Abav7Fluoy8PonqxLnzqeSIisXVyOOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YXIy2qRY3m4JoNqfvZNIVm9KUne3fxI0qe7Yqqt3EGs=;
	b=dUh7eEk0w3J8RKWsOo1KNzE5wn8QRBJUAk7MVsYVgV2tPrvzoUQL9GxpfU9uEHEgjj/L
	 v3SGp2cIFE2djD6kQjVw6VvxK0oUA1mbC92zDr51LeZ/SrC3T/kuI9PGgg5W1PZwGk2ZJ
	 39N6iVcQydkRLfnFN58a39PfauKSFeweeJSRUdEEnAFnEJ4AIVf+XJew5aXUiDC6Dmhzy
	 8SRKHxnzpnKV7Yb10URSfdGE3J2++us8e2gK4kySQ2OXVU2lqwsSUlOVaFq2eXQDIcXYL
	 lHxnxT67Cvvn4qUiYdTKA+6OaPtZXcgfFO0a6uqNvNIRptIWMSFquF+slICmi7XcXDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=J7TMm8T3;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A2A606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38A2A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=J7TMm8T3
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5364d86f7f0so25845091cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794335250; x=1794940050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YXIy2qRY3m4JoNqfvZNIVm9KUne3fxI0qe7Yqqt3EGs=;
        b=J7TMm8T34Tu4l5OHcANKwx0/ZOzfapRBnEg4cXPKDFAtzJrkdsQLmXQH1PNBaI+LZH
         HQxhcvnWaPMv4Mdu99jEJKX1gAfpkqK9bmVZNQr4gKf5Et/58JlVsH9oOxDsx7bqpFQu
         ZXW3WV+2lrudMoNdhU32xg9MgdSNO1NqIogSK+UVa/6AQgjRkJQkqGErKB9UAMu1XqgJ
         3fZPTlqW+B98MNIeDrnpleLnnPacRQ56XVQM2pIc4xb54sJcW/ZDtQ/K4p7vR1GL4gM3
         rK7V1sGMQaqI7HfANYUEMk0S5fY/S6x9xF1CTrUP9NqUwRARSKYQRXehKzOgiVLCp6ft
         i0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335250; x=1794940050;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YXIy2qRY3m4JoNqfvZNIVm9KUne3fxI0qe7Yqqt3EGs=;
        b=OxlOItMZ6BuwviZsKdz1isxV5A2FYIrmVeDwA8HuuT1+5m00OqpGeo+z8AN95gl8Wr
         M9RQq7WJFubNU5F4Nnke1EELAtMMpP0ChU4p5fy1rOAdI0JCBXeQ/cQqIfMQlFhi33UD
         Zv2sB79UqHRmANnxFpH2dT6nXiZhOsb1OJV3nsqYw1GWJSfLovEy2nDcFIffjZ36EDy/
         aisBvZRXcZQsoAs2EfQ3j8GaMGEIN2OA0Sr3XQZ7QJpKE6E+0ePAXT78MOrpb2sO9d0Q
         D9qL9fIzjtSHjC0HXdozSyxDtsXBbooqf4M6rL49o4Jnoz8QkqFDFC4oNXuz9LXGnGBn
         sx5A==
X-Forwarded-Encrypted: i=1; AL+hErEHtGAVQ7F0XQXgqyqihfXvYZVIrcY3j+uHY2zaIJQzb5hS8pIDuFMF5760sUv2QbysH7qFd3hcupG4EL4=@vger.kernel.org
X-Gm-Message-State: APuU4Z891Kkt6k6MIkw2be4LpvPXn3BurV/tJkkkwzcayyF3keGWAERK
	/vcnryQZT5JfSW4bIUxCxb3GNEYUKIYPUPi16C/k/Y71CZ+RijFsqsacVHlm2+H/hYo=
X-Gm-Gg: AYBFou1JN2oiJTGxpnfIdlPG8rdSvXBqFbAwWGyUjkXIPMmE7MnjX2/wLWLx96fz7zJ
	qPVC4AYYYg6GDId+uSFfJKa3X9Yvy6VhjpJICUhzlDYmzD+5fntEseDJj1tQvQMo941mFHBIZfU
	KmrVyEtFQxUSS+BUdsCT97XAoyCaOIgGLFUihM5/R8W9QMQwtboIy1dzfQrzIkTse2kTknPYquR
	LgUw6bPruaZPPTZqTsdCgCN5Xxv6LrWe6i7vaC46ms6kjhesDHYzMlBP3AjgoGp4w1ls9VI/CkQ
	9tzVOl/vCYPgJqqDjujCgDhFnrUm+temX3zmjWFBYUvyu+ZZObPa5HjaXuparRreT4ByuhKct/a
	+BPKuMu6QNTOMshPz1WEE48HvJ9YN1oMrir03eL8lEn0nyEsNgRxn4FZbnGgzCE1qufa70/Y2s5
	+BDEX+z8bYWjJ/asVoQ8mGKkNFixj4uplXfoO0sdyu77jsQPWMJEnVntf7Hry54fA0g5bVwlA7d
	oBDLb4qQkuFSXhjikuQZuzsteglrhxwaZFdEXyPJ+07UaWjMuWVrBCwwpk65H3R1Ve3Y87DWc07
	OrDFzI+Mzloz4ibEny5iBBswCWST8Hta+zGXaTqy10DYxiv91XwVeL5bhYU+4z2hovlpiUzuiHH
	umHWVL0yJx6I=
X-Received: by 2002:a05:622a:313:b0:51c:1590:8e13 with SMTP id d75a77b69052e-555257c5f22mr54402921cf.4.1794335250028;
        Tue, 10 Nov 2026 10:27:30 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-555093d9c3fsm30362981cf.3.2026.11.10.10.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:27:28 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQqZ5-00000006j4S-49JU;
	Tue, 10 Nov 2026 14:27:27 -0400
Date: Tue, 10 Nov 2026 14:27:27 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Fang <peter.fang@intel.com>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"drdeeglaze@gmail.com" <drdeeglaze@gmail.com>,
	"James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>,
	"aik@amd.com" <aik@amd.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"Xing, Cedric" <cedric.xing@intel.com>,
	"alistair.francis@wdc.com" <alistair.francis@wdc.com>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"ankita@nvidia.com" <ankita@nvidia.com>,
	"jiri@resnulli.us" <jiri@resnulli.us>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Jiang, Dave" <dave.jiang@intel.com>,
	"Quigley, David" <david.quigley@intel.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"jpiotrowski@nvidia.com" <jpiotrowski@nvidia.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"lukas@wunner.de" <lukas@wunner.de>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"ksinyuk@kernel.org" <ksinyuk@kernel.org>,
	"sameo@meta.com" <sameo@meta.com>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"qinkun@google.com" <qinkun@google.com>,
	"pgonda@google.com" <pgonda@google.com>
Subject: Re: [PATCH RFC 20/20] attestation: Add the TDX family implementation
Message-ID: <20261110182727.GA663069@ziepe.ca>
References: <20261023220030.GM3977851@ziepe.ca>
 <7843a833723e3aad40f8fc4de3a83f5a5059280f.camel@intel.com>
 <20261103005851.GH3889730@ziepe.ca>
 <au5LCE1jau0yDo5S@intel.com>
 <20261109171236.GP663069@ziepe.ca>
 <cbef9bda9241ffe98652172edb67fab3eb1c35ee.camel@intel.com>
 <20261109234252.GR663069@ziepe.ca>
 <4c75b369b68c98c5c35e296895b6935342dc7dc1.camel@intel.com>
 <20261110131114.GV663069@ziepe.ca>
 <avNfZ0lLl-OrkCHs@intel.com>
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
In-Reply-To: <avNfZ0lLl-OrkCHs@intel.com>

On Tue, Nov 10, 2026 at 10:16:07AM -0800, Peter Fang wrote:
> > It is not local quote processing. This is labeling data properly so a
> > verifier is possible without the user having to manually and directly
> > inform the system what versions of Intel CPUs and TDX modules it
> > should expect to have.
> 
> With labeling like tdx-quote-sgx-1.0 and tdx-quote-eat-cwt-1.0, and
> enough knowledge of these labels, I think this can be achieved.

Yeah, that's all I'm asking for here, and it sounds like the magic
bytes are enough for the kernel to deduce it and pass it to userspace.

In future please transfer labels along with the blobs through out all
your paths so we don't have to parse magic bytes to know what data we
are holding.

Jason
