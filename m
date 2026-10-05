Received: from gwu.lbox.cz (gwu.lbox.cz [62.245.111.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5394432FD
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.245.111.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791192699; cv=none; b=Q1vmQEXumYotaDjXgxwpxO0JFcL8+iWjESDXylOHxzUdOnDUxL708OlWsMK6cU/2mAcul4NmvPxcXKiNH7Akxg41tYSZiT4m3MyF/4L5X5+bcuNnVl5lEqFcqsvBGk2sZD0w2jcp4QRTEgY5RdHrkLwkz291RhaLlfVBRi4z9Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791192699; c=relaxed/simple;
	bh=4dK1t9/7nUmp2dPlKwWv6j487aRsbkMk3Td44bvTXuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1NJRopOt5/MEaozjp97PiwVq15OqW15U3izaewufTOJ94iHu4GbR6MCSNNwIKSQTnBLRrjs6g/pb0fP0NXFePUPw6t7eBRnvMGFJSbPZNkrjY6ga58msKK1yV4AryrpbCpuY+jXiTR7Rv04H97tcFIcbg0Yg+ttBKPEkU2YAHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz; spf=pass smtp.mailfrom=linuxbox.cz; dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b=4sE8ky3G; arc=none smtp.client-ip=62.245.111.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b="4sE8ky3G"
Received: from linuxbox.linuxbox.cz (linuxbox.linuxbox.cz [10.76.66.10])
	by gwu.lbox.cz (Sendmail) with ESMTPS id 6959VFPh4139732
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 5 Oct 2026 11:31:15 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 gwu.lbox.cz 6959VFPh4139732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxbox.cz;
	s=default; t=1791192676;
	bh=BBrWUUXSCL9gFn2uxP6KDGd2JEbEkHet4WqBH6N7+cY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=4sE8ky3GOzfgE9kpii4L2Xy7yl3Zikrlo4fNKWxq5s7V9ucCj++gMHfHbqn9VdBv1
	 YbPtF0QGA9G7noXmv2CTHzdHcotaZqpi6HI7eoeFz0PPOuGLkvQXQyjeePbeoQGqrS
	 6mFKXe/j7ZxL98FmttFEoLqvRLedCZD2HqY6l1q0=
Received: from pcnci.linuxbox.cz (pcnci.linuxbox.cz [10.76.3.14])
	by linuxbox.linuxbox.cz (Sendmail) with ESMTPS id 6959VElD045326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 5 Oct 2026 11:31:15 +0200
Received: from pcnci.linuxbox.cz (localhost [127.0.0.1])
	by pcnci.linuxbox.cz (8.18.1/8.15.2) with ESMTPS id 6959VDSw2367544
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 5 Oct 2026 11:31:14 +0200
Date: Mon, 5 Oct 2026 11:31:13 +0200
From: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
To: Rik van Riel <riel@surriel.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
        Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <asNuYVRrhwOvdWyu@pcnci.linuxbox.cz>
References: <arY1Wq6R9OY20ans@pcnci.linuxbox.cz>
 <e31bb97e34de9e37ef27f02ff98f63fb17fc57a0.camel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e31bb97e34de9e37ef27f02ff98f63fb17fc57a0.camel@surriel.com>
X-Scanned-By: MIMEDefang 3.7.1 on 10.76.66.3
X-Scanned-By: MIMEDefang v3.7.1/SpamAssassin v4.000002 on lbxovapx9 (nik)
X-Scanned-By: MIMEDefang 2.86 on 10.76.66.10
X-Antivirus: on lbxovapx9 by Antivirus 
X-Spam-Score: N/A (trusted relay)
X-Milter-Copy-Status: O

> THP has a recent patch that may be relevant:
> 
> https://lore.kernel.org/all/20260903031608.1194238-1-vernon2gm@gmail.com/

this one got to 6.18.53 which also crashed for us (this was the last crash,
from which I have complete vmcore), so we're most probably hunting another
bug.
> 
> > As a safety measure, we've disabled THP and NUMA balancing on all
> > hosts.
> 
> Does the issue still happen with THP and NUMA balancing disabled?
we've disabled numa balancing on all suspected machines, but there was
some confusion with diabling THP, so I don't want to bring some confusion
here.. let's rather assume it was NOT disabled.

-- 
Ing. Nikola CIPRICH
technický ředitel

+420 591 166 214
+420 777 093 799
nikola.ciprich@linuxbox.cz

www.linuxbox.cz
