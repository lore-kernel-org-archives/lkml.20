Received: from mta1.migadu.com (out-95.mta1.migadu.com [95.215.58.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EE9494820
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622164; cv=none; b=h3UxgIICG9IgvUhX9jkMrXotEkWRm1ner4EjDvhmEd0hmzQli28mirXWSuaThOWpzAZmkDRkl3MGKAQEaztak8knD9SpIzvk6Pq1cCLmVaNy34Jx+SnS+sU2QqsMk8b5NIOBSM7KHo1IGt4dXT3GfRmDIRZZEYLXYfbMW+xCemg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622164; c=relaxed/simple;
	bh=5f2NJtia5rl9MGCcJES+0tqBT+y20jSTkAzod6g5yJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YNHMNhcMQDmyFofaz3z4DjxlNsxNrNN2z9zayqtmOOQkUcqd4XP26X2bSZZScmhUhxVv39aZQuXX22pMtXyPQafY7OPep4Dhoed7O5c9UWjXSASjtElp8y7q3H7KbSZH2sOCKsAWfYFJWnvLg372EeA8PX0Tcpd7YLO4npfztWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Bpw6Ego2; arc=none smtp.client-ip=95.215.58.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Bpw6Ego2"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5f2NJtia5rl9MGCcJES+0tqBT+y20jSTkAzod6g5yJA=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788622159; v=1; x=1789226959;
 b=Bpw6Ego2vB1U3zG5doeq12mdQTDkWL2rEKO07S1jljcaLesC+Z1P7+E0X/2A8YVo/SSvB2Sy
 i5qqB3F08Lwwz8eFk17BXkOP4/4+y1d90j51khUt23LCs+KkLBkr1rN75opu8el4zgjLVhkR99H
 jBR9ne5duR3yr6gVAEzXog+RH3oEkIAYH1+SpZESfqMUzJQrM57tBPGTyMGmusrZopjArBTNvTe
 yTZ8dfxc39unrzORmkX0N3wG7T01UGY5gJlGQ3xwDFmPz0/pX5BtIowqWCC+62IL9o4XwjS7KJr
 R1YWEGyE8myHdSkMGI8uzIA5ZRM/7p1sCXt4woQR1iv1g==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7a99cfa15dc6dd0a;
	Sat, 05 Sep 2026 15:29:09 +0000
X-Mizu-Trace-ID: 7a99cfa15dc6dd0a
X-Migadu-Flow: FLOW_OUT
Date: Sat, 5 Sep 2026 23:29:00 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Jiaming Ouyang <jiamingouyang13@gmail.com>
Cc: linux-doc@vger.kernel.org, "corbet@lwn.net" <corbet@lwn.net>,
	alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: add usb/ohci translation
Message-ID: <apw1PMXXv2JmDX29@wyuan.org>
References: <CAMnqnYxPHeXo6CsuKRGH=oixAsAa0z1_++266yzKW7qR6cqykw@mail.gmail.com>
 <apqWn2EoguCwX5po@wyuan.org>
 <CAMnqnYwSKeTHi41iesHxJo1b_GGKWkFzfavJHWtEqxD0St3oBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMnqnYwSKeTHi41iesHxJo1b_GGKWkFzfavJHWtEqxD0St3oBg@mail.gmail.com>

On Sat, Sep 05, 2026 at 03:29:36PM +0200, Jiaming Ouyang wrote:
> I think this .patch in attachment will solve this problem, and the

Thanks for the effort, but sadly, "no attachments" is a better practice.
;-)

See:

https://docs.kernel.org/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text

Maybe you can try git-send-email later.

Anyway, I manually saved the patch and git am -3 works while git am does
not.

> commit information has been modified according to your feedback.

Yeah, I think this one looks good, though.

Thanks.
