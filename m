Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20D44CF49C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177447; cv=none; b=pyrV6spQ1t7wN2Q4nQQvQQOZtF6gkUEf2LN8YFQL0G3gAYQn1gMa10gXvLUZ02PhAoZq9xWRMfP7Q+GfRFk0WvEBFAAB7NOiCcLeb6eMt9wI7isMdHmRSrU5tjnvBPXU4t7/YxO83v/RyJLrg0BN4r3RC4sGgJosJpkMLmZvF7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177447; c=relaxed/simple;
	bh=W6Kr1B7V25s/+ErZIvkn6Y1qhx7RMeoCaI29CL5uHe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3UFWKWToJhe5h9Tci274Nxcx/SYVWj+WfQdil6AkHyVoEllIini+71wfM4eIfk8MH15vN4VitgT/PZPtRdQEAmjSL5xyqGRwna/EQUYeAZC3oDMdD2+nNcBcBYhKlnA7A6ojKesALA6iR1eFFFj7uIh4yYeHdnohhgva9O+SbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gH1i9+73; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gH1i9+73"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35b2c599f43so445418eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792177445; x=1792782245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hqCDWWyE+/CBKZipmpjsIgaXREZgrpMVatuFhbPuqzQ=;
        b=gH1i9+73bB2gCPsSH6ajh8OHM1oRQaRSe9xIlYQNbUGn1W2G3px4JkYv9arKwdihb6
         HQFeuUO/p9+S10v3F0yPk+4s991Ac8pj4t38KAkn1gMwc11xcN1FOQDz3/wXvQZK1Hl1
         e7kdzqZcIxH9JVNkIfkbWzWF67a4q86K2K6Ei5tBTZsIIzvW3SNq70I1Mtcn3jZXim1w
         FU36ZtuciXOqlqOjRoHUgz6uwfSZqSGbh+q26Z1hkq0m/YcvAOzB8ga0kLl3kpb/6OPs
         or5JpLO75ORz4m0RRO4lKl3a39FAbWin1O7jC5EEp9ls8kRPHrXepdRqGxP3FL7j2XH/
         ztCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792177445; x=1792782245;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqCDWWyE+/CBKZipmpjsIgaXREZgrpMVatuFhbPuqzQ=;
        b=glbi/mjBHinKr/RfrEyvwSzn4OkXrzwGaKv+BDHgIHxhK2t6H0K3GP2TDhG35t9EVQ
         mEBI6QghzHq8yaVAS3USZB6R4EYZz76CjA7EEdNsqaNSCLBdX+axViQP+NWJO46O1jRX
         FoQOxbNTl8W9iN9rQBvbckyg8HJ47IhneKlBxgqEHQyclfNT6zVBWGv5M4O7npms1Ca7
         2kBsOTvZRoZU/TjkmtRP/kq9RqO9SYSpScQDt06y/LoVvCliyXyUAoY0n/rCWi1loxow
         6uL/lcN8m73ans0GZt1hM00CupAjDxlPBtJgU7dbSLS5RCCSWNA8tB19bwIRodmVTnVN
         iMOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFVCGRBl0wL/cj59S8kOzKpGKAQSSRVUvsTIVEENvm6Ia/MjHgKIepwCt9NfPoN7FIJjqB9vYqkykkk80=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRKj0V5dfBWRm5P7hOmBES7NyYU6mWZ+mteXIfyQzJ9fPPcxjU
	7Zh8cZlkgugL2XhWzCrFDpUEWBjqYe3ZEAyiBYvvM2LdWjK3J7PJ0mx4Q38kL1qv
X-Gm-Gg: AYBFou3/mUzcQCV4w15hlkR85OYSme6C9DCnZJnhGAqOloff7g3qp2Co/RQnB2iuWLo
	o3IoEd3DMlVr4BQCim0oUfUNIvu1AGno+0XARmKqOPF3jDcWwO0TSbaQLp2WoSnil44aaPAVf+L
	6EsVMVL+4BJ5wex9rXT1cTZul8KpyOY0Vobwq0zxi3MEdrpdPxubeTMRrN+OiGlTNzkxWYIoGoU
	bWPZA0YUBVgHXy8Ry/JB81/Rx4kkIgYh08OdsgwFMI+++I6pqOFT/Gjcqmt4dwyOtddIJ0ootUY
	8ZFDJrTL60Fc1kdv73W48IzXMCbuWO8zzYn+dRV/pJ/g20EVvtwcdCYuuhk6cP5Js4+LYunjYG3
	k50wUc3CDF1ZRA4MhkEau8ICky7FXzMUXVga1JZWEoVfkcAN6qxt7H/dqaxbCyStXfztgLvnUlQ
	z0o3rCj3LF9dp/daHkyjWZjIEwO709mMKn+3qzZRyKINwpsy9uPB2ACtRf9QEK1RRzlD3RPvmF7
	fbVfvTD
X-Received: by 2002:a05:7300:de49:b0:35a:7020:c08a with SMTP id 5a478bee46e88-361a186094cmr795638eec.19.1792177444384;
        Fri, 16 Oct 2026 12:04:04 -0700 (PDT)
Received: from fedora ([2406:b400:66:38ee:e4b5:9757:d5c6:2111])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ba424a6sm7596781c88.17.2026.10.16.12.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:04:03 -0700 (PDT)
Date: Sat, 17 Oct 2026 00:33:56 +0530
From: Mirza Ishan Beg <seedandsyntax@gmail.com>
To: Slawomir Stepien <sst@poczta.fm>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Kees Cook <kees@kernel.org>, syzbot+6102f1c3a0ea8073fd64@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: dvb-core: fix OOB read in
 dtv_property_process_get()
Message-ID: <atJyM5S5rekF7i95@fedora>
References: <20261009142303.166373-1-seedandsyntax@gmail.com>
 <asyMkMz-T1LvvrFi@nr200>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asyMkMz-T1LvvrFi@nr200>

On Mon, Oct 12, 2026 at 09:30:24AM +0200, Slawomir Stepien wrote:
> Hi
> 
> Tested-by: Slawomir Stepien <sst@poczta.fm>
> Reviewed-by: Slawomir Stepien <sst@poczta.fm>

Hi Slawomir,

Thanks for testing and reviewing my patch!

> Thanks for adding me! I think this patch is better than the v2 generated by syzkaller.

You're welcome, happy to help.
