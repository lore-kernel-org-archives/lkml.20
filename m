Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146522FE057
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789352520; cv=none; b=LWz7WN4R1+/+uHKmE0KZQ+pUpVQ06/9B4NrJ4Z4RXdorzI6bms9TOtyohXr9/ZxpZasYkN2RcHm8x9UrimTR5y8MKEwG8owAZDA8YGGaAREe9PSbtVcGakO8MgqFDs3yh/T/5RzqA+CYR256ND9uNutrge4aeFlcIwlKNMCkJa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789352520; c=relaxed/simple;
	bh=j3FXNzKD4CD8LOgu8iAzcOcJWjM+ixBZSsPkbTomqXo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ab8wcf5EG5R42sZdITxHcwpdi1VPyn5+FeaBejrU5Hqg/kvWqWq/4p5LpniHcZWcHz1+1bwLxsTkluu/ZCHSczshDGkr15F52iZIvgt5yZKOwa5SVxfBho64VJtmhxudKhs5VcqS4g1r7ixeWSMQfBTPXq5tKtaWCELLqgIRYVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=llmmY0Yu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=n+/wZI5D; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="llmmY0Yu";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="n+/wZI5D"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E0XnTF2188069
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:21:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=nInx
	1VH35Epcou9Wq3RVNpTEcmqfUoV1uVjarRJrYcY=; b=llmmY0YuceyTDLvVZmF3
	8Af+YvdY/zDhUMKuOW8vPwhu9P6ojb0pxJCYrer+Gdjkq28mws2ACv6CJsFyxIlX
	w8gUnW2f85wLyPYzJ9n/EmmrvTOyqKfcNOIuPVEziUlZnskMFRgSHFXXJkVuneQu
	mEyhhyPZLYOWfKCHoVzbPJtO8AppwVOSgS7qykNabk2zUYzsdAPj1gyLtFgKzM39
	c5tp7UOm6q/MlzzqIyZRLJJUji3yWw3xVFYkFNvzpKHfb0Cbn+5bNmnfUuEc+S3A
	+ZLrOqDuMVn8j4b0oXi+HP4Z73PDCqWUoafHVAs7ByeeP1qCUox7GA28s1qLr30I
	wg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gp1d1hf65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:21:57 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530f962fa9dso31962451cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789352517; x=1789957317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nInx1VH35Epcou9Wq3RVNpTEcmqfUoV1uVjarRJrYcY=;
        b=n+/wZI5DNXWAF2adOCPeGsvVtCmGyUUBlrYFMZkOUpGHr/0AeuVqGStR9erW0aUjzp
         FS5gftPjOZb/h95nPYieyzVioEyoXSAtWaWxRxxEWJWQe+0Y8e1CMrKWvplRVHg8aXqY
         GzRLlx6lj1frXNeMlAgeaCBJCR/Jd4sz3UZ91Zlh/rPFQu9O8jt+z/SwJj3Ebq6lB6gw
         FV0+FdJvHbHmo7urdb1C9knKEf47Yd8d93l1MlWSaErTBztarzZASprqGvl2z6dLrI9p
         NXvWKlrBUcwW+IiIypfT3rQPtJVFHMMke78AtWykIuveDN68/yIVxtCIuhRMbY/OzcOs
         +RJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789352517; x=1789957317;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nInx1VH35Epcou9Wq3RVNpTEcmqfUoV1uVjarRJrYcY=;
        b=FYjJQPz6BL1kN9HXTNvqNE1EII/V02SbBd2as+4450sLv7mSdCqoANfMXRe24J/RgP
         UlBaWJqAhQeEP6sqokpr0GjD3Q4J02KdUFN3Q1WzWznbx7axsGwobnRfyt5RGoQAqGb1
         oN+Fz0ClGx3KsOWRaTs6OyOC1FCFv+OQ9V37buVF+5yqZAxppKyKVvlCjS0TG1h1DAFI
         qQMd4j1IpvLz/HTCfVW/q2wWU9T87cjSmechBQVz7fcAisArDyEgXcjkmp4pRjNjxdP/
         uMrq0FAQl6newNdh6mmMxvGDQ5ic3uE0C5aOrQ1vkvq5UaD+Fr2TXVmb7lzJV4op07LH
         PNrA==
X-Forwarded-Encrypted: i=1; AKwUvBxZw8KVbcqyOoMQwIsWteqJuQ7I108M1Rep6T/Gr/sPoBGwSLb86sO3NS1DnklKR4PK/BJEPUF4r9vVLjQ=@vger.kernel.org
X-Gm-Message-State: AFuF++korfNIvJ4RBReeaUyoDpv6M3S7jWL6s230WS2m6XXUU/FHxVVx
	usN8KRdpVnhnHOr7YtN2Vk5rEK1yxn8+VZWHXXe4OC0ingt9QHvvNo9G1KWPt82KcGttCgeC0pv
	PSSQxO2IP28mz5OfDLhFNsHdAThujXKbggMkCiKLFQaUfC08sa22WR2iU0J7vlg==
X-Gm-Gg: AYBFou2ZaSrxYPhIziyp6yh8chyi6NIexWOs9eJb2Q+TzVqkKnMwazk5NBSCnrcedWq
	yBFiVpT71Uzxdv60cNutktCi20PhKf7+C8YGBetmSSIZOO7NTwbDMuBm6eJF/OVFBMvgvcIHpa9
	eGjUIjtzAE8D259S5cFF8341XngujNCwcFA/25vpyJ+wjbJBelySv5cVXMMrrEbct0m5n5vZdTY
	dLLFJl0iu2hdEdzrKT2Jfv+B4xkFvommWBO5uc2BIydEYQfY4LS2xsLO7Hq/aElxloVc7N6JT9D
	BDEc2OvZTKzlKa22V45UZ29L6522KPaikn757hDdzXHHxonqEkhAB47UjggW2fefPM5/HD3ZI0/
	y6xnNyJl0DhPcmk17E8/X6T8WszaYyDQDsK35lNtEYgvWk+YfXGP6QSHcIHU=
X-Received: by 2002:ac8:5a0e:0:b0:530:b2e1:2f3b with SMTP id d75a77b69052e-5310d0915f6mr9090061cf.50.1789352517061;
        Sun, 13 Sep 2026 19:21:57 -0700 (PDT)
X-Received: by 2002:ac8:5a0e:0:b0:530:b2e1:2f3b with SMTP id d75a77b69052e-5310d0915f6mr9089891cf.50.1789352516656;
        Sun, 13 Sep 2026 19:21:56 -0700 (PDT)
Received: from localhost.localdomain (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca460a32sm87027651cf.9.2026.09.13.19.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 19:21:56 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
To: Borislav Petkov <bp@alien8.de>
Cc: Tal Zussman <tz2294@columbia.edu>, Rik van Riel <riel@surriel.com>,
        Matt Fleming <matt@readmodwrite.com>,
        =?UTF-8?Q?Henrik_B=C3=B6ving?= <henrik@lean-fro.org>,
        Dave Hansen <dave.hansen@intel.com>, dave.hansen@linux.intel.com,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Tom Lendacky <thomas.lendacky@amd.com>, david.kaplan@amd.com,
        Ingo Molnar <mingo@redhat.com>, luto@kernel.org, peterz@infradead.org,
        Sebastian Ullrich <sebastian@lean-fro.org>,
        Joscha Mennicken <joscha@lean-fro.org>, kernel-team@cloudflare.com,
        kernel-team@meta.com, linux-kernel@vger.kernel.org
Subject: Re: PROBLEM: Probabilistic segfault on AMD hardware with INVLPGB
Date: Sun, 13 Sep 2026 22:20:55 -0400
Message-Id: <20260914022055.1639690-1-tz2294@columbia.edu>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260708155146.GAak5yEiHU-YM1Wid9@fat_crate.local>
References: <CAAuFnRTyva1_3tsF3vrMBL+TLS1YL4EgUPT2c3O9k7A9hWUMnA@mail.gmail.com> <20260708112718.13323f59@fangorn> <20260708155146.GAak5yEiHU-YM1Wid9@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: c9taaG4JIF3iIvwNmVGkKTP2kIvMdHY3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAzMSBTYWx0ZWRfX+TADPyDZicv8
 PKAPFqa++2Lad72PYxjrsVZUY+Zxwf/NtrnGiqGrh/+O1EiEoUyMWip9JTaNKx+wvo4omIaxPVZ
 INmAy+gnKmzBMgD8YnSzpTt1biOiIqfZSL2s3P3QM8swRCuIXkoFPcXSeJpIelAmqBWEFuu/N9R
 LCBNIk8EZ3iBh/7QVTtH57ujsAAkk/kb97M2OWxNzBSD80EGfIcExiDk2YObhySffbx4qfqUdc3
 pukzlZO9IJ8LT4Vtx8oEbC+ZMTPLeAq59VjqvdOV19g7SOKs8jcb3eHsdfSubTsl3h5nKaFoEmg
 pWyFDkgZIk0uA05VnqwG6BAmZRiC5c+cpab7Eecyp5Ltk1tbXp1x+UCPha371u4IMh+8bVNASU7
 Jqva9/wdR/17RMsE8dmBzIw6CxN/7QBrQfD+Y/0Sk/DZp1TZWLkssJ6doqObCq3w+q/iT+lj9cP
 q4UHpMTm3rlubJdyYPw==
X-Authority-Analysis: v=2.4 cv=PZxqFShd c=1 sm=1 tr=0 ts=6aa75a46 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=khj0w1aiWSCWH1ncQDsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: c9taaG4JIF3iIvwNmVGkKTP2kIvMdHY3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAzMSBTYWx0ZWRfX+ISKzGEcS4bh
 cl0nfVuQUdmjJk8mcFdSePUBT79aIJjB7yy3ImTzIs/aLbrn9Jt8RioNW5Bvdc79kuurqepDGXu
 YNs8borBmkX3Vo9f6t5J5Gqry3U2xtgMSzFwObO+CAfkTPX/2Mq0
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11904
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=10 phishscore=0
 impostorscore=10 priorityscore=1501 adultscore=0 bulkscore=10 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140031

On Wed, Jul 08, 2026 at 08:51:46AM -0700, Borislav Petkov wrote:
> Thanks, we're looking into it now. I'll get back to you.

Hi,

I'm running into this issue on a Turin Dense machine:

  AMD EPYC 9965 (CPUID 0x00b10f10), 2 sockets, microcode 0x0b101028
  AGESA TurinPI-SP5 1.0.0.3
  Ubuntu 7.0.0-30 (7.0.12)

I tested Matt's reproducer and it results in corruption in the first round.
With clearcpuid=419, 20 rounds pass. The multithreaded service I'm running
corrupts its heap within seconds of fork() under load. An extra INVLPGB +
TLBSYNC from the forking CPU after each fork() (a one-page mprotect toggle)
makes the issue go away.

Is there any update on either a fix from AMD or merging Rik's double TLBSYNC
workaround?

Thanks,
Tal
