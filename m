Received: from gwu.lbox.cz (gwu.lbox.cz [62.245.111.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4140D521894
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.245.111.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793670; cv=none; b=RJfLDmKnvSPbJZQFAMWWYb9P4D8F/mXH/fVDlJzNR8XkgewDtjvW93tS1P+d3c+o/iGNK8tOaUOKfzLoqY9xqGjzDS2tM/eobG9DFDqfTD/lXIsFJhkwGDlY3eQ+LrLC3pgPyW+9bMHCjKdt5/CaD0yTDQxcyDiCDm3WNaltceg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793670; c=relaxed/simple;
	bh=coiuWKEKyf6N6g1IKuJroxdQZLcdsd6Mn8u6PehWHoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNWjjdDDH8jlPy4IH1s28PJRMoTduxGrY1I69RIKtPMI1WEbAUPdnGd/buLTfprPVZZZcKxBpiXJdFc5yq9bn0wxf0W60UKh7l93+X8zoTg5BDPKI4HTE2lYBHI5IZubhZWOOs0yDmiUyDwn/wg9UPAss3XnN3Ne/M4gKk5ZfNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz; spf=pass smtp.mailfrom=linuxbox.cz; dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b=HyAdT/rm; arc=none smtp.client-ip=62.245.111.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b="HyAdT/rm"
Received: from linuxbox.linuxbox.cz (linuxbox.linuxbox.cz [10.76.66.10])
	by gwu.lbox.cz (Sendmail) with ESMTPS id 68UIeRrL3595274
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 30 Sep 2026 20:40:27 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 gwu.lbox.cz 68UIeRrL3595274
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxbox.cz;
	s=default; t=1790793628;
	bh=UQWLRh3cX6MfBpqZVLbNMuRtWRQ1VYNiu2fQhkvtL34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HyAdT/rmOxoXRyWcabqH9NuxGQOg1f3d3+pRv+UfT0eNMm5SUrw36bNlFLQgKPrP7
	 kJWTBeKnbKn+9izN0S80adjyt1kNPtLbMHrT8XWU76mQZsE1W9MMd9Im7utlYmP9hD
	 x+SCeYCM/vlCdWX03EsostEOH5kGxR/r1PbuKm00=
Received: from pcnci.linuxbox.cz (pcnci.linuxbox.cz [10.76.3.14])
	by linuxbox.linuxbox.cz (Sendmail) with ESMTPS id 68UIeQTt020450
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 30 Sep 2026 20:40:26 +0200
Received: from pcnci.linuxbox.cz (localhost [127.0.0.1])
	by pcnci.linuxbox.cz (8.18.1/8.15.2) with ESMTPS id 68UIeNha2112989
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 20:40:25 +0200
Date: Wed, 30 Sep 2026 20:40:23 +0200
From: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, david@kernel.org,
        Mike Rapoport <rppt@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>,
        luizcap@redhat.com, pbonzini@redhat.com,
        Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <ar1Xl7PE2rcoT9h3@pcnci.linuxbox.cz>
References: <arY1Wq6R9OY20ans@pcnci.linuxbox.cz>
 <arZHp8hjYFXE8Rkt@gremlin>
 <arde/t0zQNEkWqi5@pcnci.linuxbox.cz>
 <areOeRwZOez0eHm7@gremlin>
 <arotyz5g6LozSjb1@pcnci.linuxbox.cz>
 <arwNebjYXyGqrp32@pcnci.linuxbox.cz>
 <arzRBv9ceJsxJppI@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <arzRBv9ceJsxJppI@gremlin>
X-Scanned-By: MIMEDefang 3.7.1 on 10.76.66.3
X-Scanned-By: MIMEDefang v3.7.1/SpamAssassin v4.000002 on lbxovapx9 (nik)
X-Scanned-By: MIMEDefang 2.86 on 10.76.66.10
X-Antivirus: on lbxovapx9 by Antivirus 
X-Spam-Score: N/A (trusted relay)
X-Milter-Copy-Status: O

(CC Paolo Bonzini)

Hello Lorenzo,

> 
> Yeah 6.18.15 is expected, I'd not say reverting is really worthwhile honestly,
> given what you've observed previously.
yes, I wasn't available at the time he was dealing with that..


> 
> Maybe worth checking if commit 26505e1b5b54 ("KVM: SVM: make svm_flush_tlb_gva
> do a full asid flush if NPT enabled") helps in that case?
sure, I'll do that.. however, the patch doesn't apply cleanly on top of 6.18.54 at
all.. what do you guys recommend, is it OK to adjust the patch to this kernel
(I have to admit I'm able to do that, but without any deep knowledge of the subsystem)
or do you recommend to apply some of the previous patches?

tried going through them, but its ~134 commits affecting svm.c between
v6.18 and 26505e1b5b54

cheers

nik

> 
> --
> Cheers, Lorenzo
> 

-- 
Ing. Nikola CIPRICH
technický ředitel

+420 591 166 214
+420 777 093 799
nikola.ciprich@linuxbox.cz

www.linuxbox.cz
