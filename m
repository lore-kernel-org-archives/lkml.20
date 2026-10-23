Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768970;
	b=gaovRm9ycfUfN5uWyHEKQ2LEprLQgnzsRoA0qHO3UzrKDDdXJatfYHIycDi+G9HdvJlC
	 aT0UmTiFcvBSxNFaAXGA+Bbltqxkud1/PtvWwuIBycH8qAKO+rb5K3MceJIsdmSeFYOfg
	 KPYJ6pyFAV/JJQwucKFBvy7fy+Q3Jf4TfyLuasj2CN4Rcfb7gegEuMyq21EwTppwlfk0s
	 Oitp+f6d+qUBRo7Ll8i1T62eZXTAglyNgu56KwOHKuF/FJmO9wpbVB4Y9QEAc1ctuCKtv
	 AHBf+nGjGyU1f6eeV+ezkFZ6LMgatJ1HMBEwCVH9zajqN2+n38HtgWpOcOSI8abwpRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=v4diYte8A4U+5YdamvmyB/opU496/bYf8sQxy/1ok8Q=;
	b=yfzv2al/SMhImFMyMCoZzllXy5sEqqM7IxnV5hemi9OaCgCck2toL+XIdCc/x08l56ON
	 brJpzNHKrH8ZC3UYmNHRZ+rZCtDTt38aGZAZIMsHF6CMKckcfekLk7WUFmZYmRSx0uTlx
	 Hknw4rCcSNhypSi+6PRKdXqHfNl+oXgYXn4bPpUhKEhwiuWSTQp8ST5lGLbf9i/aPibQs
	 3Ii98Xr+v/o+3k5Y04Mca+8h8G5nKTszWhv3wbg82pkymdopBaVMNle4aBvChUNLZwD0K
	 85UrHlNegCXtoymmZcGE/7JlwxZ8DrEfzfFFh5yqu/9s+CZZM67y4SzDnuxLn5Z8ZLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jdWvTWet;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19C8606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E19C8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jdWvTWet
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2e831901331so6690135ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792768969; x=1793373769; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v4diYte8A4U+5YdamvmyB/opU496/bYf8sQxy/1ok8Q=;
        b=jdWvTWetHOz20UTP6LJy93vnoBVizTIFgZ87jFLJ79EGx2K2J1E/UNniWrrS1AnsA4
         h1rPe9S8fwiH8tpOJbFxz7RxaFCD87HcRX2Ls6nxke4nwwFVT8W+cAYD0nJgQER7/awz
         pr4JPYJ9bkDW6Au4lSn19MH5gqChREh1uwqQvvOwSf7jexmcqRmebHEYYMs+xthzwogZ
         LqBammWm9gmfJaNfh9gOqo91QXsyhhxfJC5fx5I4WBwrV4Y1RVrLN2xRwXgaW7Hafalz
         pB6Y/efJ4RIDJqYJgmd++GcG3KJlkAllZvyRfma4uOZPtgFkPCyGajSozyM7EnGFxS2c
         t7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768969; x=1793373769;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v4diYte8A4U+5YdamvmyB/opU496/bYf8sQxy/1ok8Q=;
        b=F1FHsbKMOmDYzF1oGUZ8HfblsSPEvDjaab+vRHJXsyXO0z2DXCMTq690Sn2Gwr9b2o
         yCIb0LMDdIT5ImzEV1/yFahcAAAr1OchBkVohg/a2H0y5ZnohO7lEFg3NirUTW7bDsQE
         m5xZYcHMaHuTYNT+TzPAExuHPZ35KpaOOaynzjM2tn9M6YHX0HgXlo+E9+Lgd47QZFvQ
         v51RtTcjU/c7N5l03yrczxZR/irASrW1evVSUFC2nHcQSCr9RyrewGUSN2Ny78OLJTmG
         h5KKkoSAoRupbQxmD4QYmJ1XhyGbwWFyds71vZaQWIaSCJ4Ts9ESjspTmDPT4ms9nyuE
         Oc3A==
X-Forwarded-Encrypted: i=1; AKwUvByNec3TLog9QXgjpeYRBbuKoilWspMtrSDAz6hk5fKl3wIqmNTiv14rpDzl4gM3x7kMrj5g09o8lp1TxZo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0DUQsPruxouObn4odSK+Zz/HQ8Eem/8naSGy1KkDUiHZKdG3l
	Zqb+dWnGlxOytRGfoAed0u6MJ3d6TaGbKVQDw0Ro9EPETrmIOaGtbcyI
X-Gm-Gg: AYBFou1Mcde3scG6NewYDEKExwwj4u3iuHy5H9Qzbkz4oG1N13pvHnmRDSCxW14dgE0
	wF1+dF0NFTn+FNAJQO0FHwbVj6nzU6yWENSrGp0bo98LjK5Gp+SiZD1Q3M7fHJ+93G/HxbDr2GE
	oh9h+jPW85K4i/NV7RyUDLgfBJZH3b4nTzhVOy/tozT6ZW+Wh2VubeJ8dA+JvU/4sCLSDcCL1jl
	xZygQ6hfGTOIgBJQPE6XdiSLFTpgU0Jt9KfSiTpDdZn/CIMtVgPaVceJLYKrLD6UNccjMH0OgYM
	hyu9C3mYKJuUicUvLBC0v1FdOUxO8tuLlmjzb+aYyxBrbV8qodeIe7XPAKLDUkgFLP1JHRz51Vv
	H0cl8/4xIOjsHsWTbZJT3+Ys1nZq6mEALGxpQ0KUiu7i7CgEWCf4VJV9ZG/o/xbAiA/RW6DsRMb
	NFrdZDrLTQYlLfZcj1bPoZfjscQES116thy1bVEjNPAGQQcjhrzIpWGusAFbp9j/6wdOUwS6qE8
	snkRSpR5QUC9xbgOPIU7D1YOCwyqu7bzXRiX3v/YhKxj8pmnNoQytwPuGRND1g9Yd/aW5OYetqh
	uhGuxHj9mPiNiWbN1lXT9CNzhagAHR+XHarudis9z5d9Rh9lLbB/
X-Received: by 2002:a17:903:1585:b0:2ea:1b9b:b946 with SMTP id d9443c01a7336-2ea7d09d3bdmr25679205ad.14.1792768969109;
        Fri, 23 Oct 2026 08:22:49 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9476f72csm1528235ad.43.2026.10.23.08.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:22:48 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Shubhang Kaushik <sh@gentwo.org>, damon@lists.linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Fernand Sieber <sieberf@amazon.com>,
 Leonard Foerster <foersleo@amazon.de>, SeongJae Park <sjpark@amazon.de>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Shubhang Kaushik <shubhang@os.amperecomputing.com>,
 Christoph Lameter (Ampere) <cl@gentwo.org>
Subject:
 Re: [PATCH] mm/damon: align MMU notifier range when clearing PMD young bit
Date: Fri, 23 Oct 2026 13:01:31 +0800
Message-ID:
 <179273169185.2.1655708299473876346.damon-pmd-kvm-reply-draft@gmail.com>
In-Reply-To: <20261023002018.102560-1-sj@kernel.org>
References:
 <179267916870.2.5637290691657871645.damon-pmd-align-draft@gmail.com>
 <20261023002018.102560-1-sj@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi SJ,

On Thu, 22 Oct 2026 17:20:17 -0700 SJ Park <sj@kernel.org> wrote:
> I Cc-ed them.  Please Cc all
> recipients who get_maitnainer.pl is recommending, from the next time.

Sorry for that. Maybe I will use b4 next time :)

> However, I think this patch explains its context very well, and therefore
> this link is not needed.

Sure , That make sense.

> Were you also able to confirm the expected wrong behavior (missing part
> of the sampled huge page and age secondary mapping), too?

Yes. A test with nested x86-64 KVM confirmed both effects. With
4 KiB EPT mappings, a midpoint PMD sample left the first 1 MiB young and
aged the next THP's first 1 MiB. With 2 MiB EPT mappings, both whole THPs
were aged. After the fix, only the sampled THP was aged in both cases.

Thanks,
Aveline Noir
