Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409E2395DBF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385160; cv=none; b=DtlJbPtyPOonHq/z0y6XqUim3istoc8p3BCwt0HgY8NsKYUJ5ksLiBYFu8qs5PXLvLoFCibYIDnmE4qwLxKmXbPGz78VAcYa/YtRGTQdU8JKkV5uVspCj9+xc9MHbKPTgPX181F1A7MG2V/XglV6w0NvYShRl0FK0auJIsxzPEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385160; c=relaxed/simple;
	bh=iHmXqjFphRDVuS5i/wBcMA/4jiTGaelUBBy672bvfxY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=jIFzqk2/OVUy7jOfynxcpn7MNPJx90A3jHq0YI+KLndAgZsE8lw8zW3HbY0CammXanAQQtoqsc+T8knT/TGEv9zunGDuTHzePpVU3iIBTsnglJCAq8SS8fYv7Kad0ZNikT6NrQH37ZeF70lq9gHvBLW/HAS+jWa/24YWD4zgw1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=nkykdCGD; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=JqQAFXYk; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="nkykdCGD";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="JqQAFXYk"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788385124; bh=Rp9bm9bTm2PViQoUzBgxPxi
	zOnj4XY3x0SF/Mb+IbGo=; b=nkykdCGDgJqoXlnwYE8z9ksDRqNjKJ6y/H3ykFjEzAIGIupZEq
	G4PYfcG/DJrf7NszYhnsMxGk/uNRu9+XH1B75ZAUU2gcrPesAUadK2f5mFzsRD/sJDSQH1vVIAh
	a5n9cn+sMvdgkdVCFkBemSsAy8LVHgAGD44tMMzcQ7hWc1pDYR0rRhuAKQp8pfpLmwlB29szVZC
	F46YVAPNTfX5DdSCyngZj4BMGupBrizq3VBEBqXLUUzE57Q78o2EtmSNR3SNtkcz5z1WvIrU9YG
	OrtdnXj73Bc3Bn/HJLZXJpoV+5AJ9JsTFKhPXnFOSBrRO6YLvMv2TraDM77LU0WDLTg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788385124; bh=Rp9bm9bTm2PViQoUzBgxPxi
	zOnj4XY3x0SF/Mb+IbGo=; b=JqQAFXYkWQKqBv7wGPIdLNNhEU82uK/BSl3fWQmPdQmpkCJm+r
	uJw3KwpkS1vz3ViPumVCQG1Z8CAqoLK6PZCw==;
Date: Wed, 02 Sep 2026 22:38:41 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Dave Hansen <dave.hansen@intel.com>,
 "Ionut Nechita (Wind River)" <ionut.nechita@windriver.com>, x86@kernel.org,
 kexec@lists.infradead.org
CC: tglx@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 hpa@zytor.com, akpm@linux-foundation.org, baoquan.he@linux.dev,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, eric.devolder@oracle.com, hbathini@linux.ibm.com,
 sourabhjain@linux.ibm.com, ruanjinjie@huawei.com,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_1/2=5D_x86/crash=3A_reserve_elfcorehd?=
 =?US-ASCII?Q?r_for_CONFIG=5FNR=5FCPUS=2C_not_CONFIG=5FNR=5FCPUS=5FDEFAULT?=
In-Reply-To: <e11aebd1-4952-46ce-849f-3a5d1ed65b85@intel.com>
References: <20260901071041.16311-1-ionut.nechita@windriver.com> <20260901071041.16311-2-ionut.nechita@windriver.com> <97887aeb-4454-4cb9-91ad-d0477d3ea5dd@intel.com> <39959DB1-92BE-4200-B286-69121F4D9E3D@mainlining.org> <e11aebd1-4952-46ce-849f-3a5d1ed65b85@intel.com>
Message-ID: <799F44D8-AFCA-4F59-9B5C-6C898D4DAB59@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 2 September 2026 22:34:09 BST, Dave Hansen <dave.hansen@intel.com>
wrote:
>On 9/2/26 14:27, Bradley Morgan wrote:
>> On 2 September 2026 22:24:16 BST, Dave Hansen <dave.hansen@intel.com>
>> wrote:
>>> On 9/1/26 00:10, Ionut Nechita (Wind River) wrote:
>>>> Assisted-by: LLM
>>> This seems a _bit_ opaque and imprecise. Could you take a quick look
>>> through:
>>>
>>> https://docs.kernel.org/process/generated-content.html
>>>
>>> and try to err a bit more on the side of transparency for the next one?
>> 
>> Spoiler: new rule added in the docs, you no longer need to do
>Provider:Modelname any longer
>
>I'm just saying, for me, "Assisted-by: LLM" is almost worthless. I'm not
>going to go tilting at any windmills to get that doc changed, but it
>seems a borderline waste of bytes.
>

True, people argued that nobody cared what extras you used, all they needed
to
know is what the base you used is. E.g: LLM

>Please just say how you used the tools. At least for things you want me
>to merge.

Maybe a --- line note could be good?

E.g:

(Patch)
---
I used a LLM (Claude code?) to (discover, build, etc?) the patch.

 Yes, I owe an Documentation/process/maintainer-tip.rst update
>for this.


Want me to do it? Or could you cc me

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
