Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A322C4AD7F6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788384503; cv=none; b=EQrKieu2cXXiHNzUy+LiaNimJZuv3kYSpb0kcvhrMbOIFV2ml/j6ZphdvP70iF3lOokLt+4CsamaQ/iiOJbZ0VWIWLIGk9Z9xGdKxYeaNIlf5bUpvX2YFS+ARDkYmCgodyiQIj77mzscjKelXCsAfisRanEf1YP/ou2b9W4+LFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788384503; c=relaxed/simple;
	bh=0idr2JfRYEloGcHAwnIDn5wMVIz23VU3IAPnXuADXE0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=grvUoQCK2sqcFb4ZpzYbLdOLvqWahWlcTsydy9Wsze99gVh0dwdic7AmnKjZwHyVQspAWmta2eCjA5aqkqR9zFNJ34+eDjz0aNhp1n9tJY67Vu10PcGZOy8kOLsq0N6yXyZ6SYFRvZBkqonUqbuiO6ZYDGOpib4xMKB47mPhKRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=jJsv8Ul7; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=tdr53U5s; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="jJsv8Ul7";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="tdr53U5s"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788384476; bh=0idr2JfRYEloGcHAwnIDn5w
	MVIz23VU3IAPnXuADXE0=; b=jJsv8Ul7OKU0x/hZ6X4zTfZ84MOslN+4lZUtD+XLA+dw1JfQr0
	d6yeDPI5VG9idy+DvGT79fIIq3QOQ8xDrz+bCX00MK4+S7rV3Q7UcvVXwCTcNOoCYUdyDuqWfJe
	Vnsy+9rIMw1Hga/3N8rWcuYqL/oXZ5dLEWYS41N+tsPeQaWl9YiIjaozfEuTRm/0N1JfmYQMQZZ
	Fb5Ccb5Ph80Af1TmarsD9BJ80OxDRqUXhOBNxqS6ycKS+Z2LktvYKJtAE4UlRxzdrB88m28+0Ex
	J/8V2uM5UnPc0QlTEttTuIEbSSSexhIJNQ9dMcPandw28V7G2aYW71knU5djFVl7rxg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788384476; bh=0idr2JfRYEloGcHAwnIDn5w
	MVIz23VU3IAPnXuADXE0=; b=tdr53U5sxswI/utko65F1O7SvAOfy0LpopgluullpTVsvw/63A
	AVtSGORs16OpdwThf1tjXFfT6bopGY+Q0hAw==;
Date: Wed, 02 Sep 2026 22:27:48 +0100
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
In-Reply-To: <97887aeb-4454-4cb9-91ad-d0477d3ea5dd@intel.com>
References: <20260901071041.16311-1-ionut.nechita@windriver.com> <20260901071041.16311-2-ionut.nechita@windriver.com> <97887aeb-4454-4cb9-91ad-d0477d3ea5dd@intel.com>
Message-ID: <39959DB1-92BE-4200-B286-69121F4D9E3D@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 2 September 2026 22:24:16 BST, Dave Hansen <dave.hansen@intel.com>
wrote:
>On 9/1/26 00:10, Ionut Nechita (Wind River) wrote:
>> Assisted-by: LLM
>
>This seems a _bit_ opaque and imprecise. Could you take a quick look
>through:
>
>https://docs.kernel.org/process/generated-content.html
>
>and try to err a bit more on the side of transparency for the next one?


Spoiler: new rule added in the docs, you no longer need to do Provider:Modelname any longer


You only have to do

Assisted-by: LLM

Or

Assisted-by: (Let's say checkpatch --fix?)



--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
