Received: from mail-ed2-f30.google.com (mail-ed2-f30.google.com [74.125.228.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF383F12E5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280428; cv=none; b=gb5sPV+7+q+uB/2xwzmxFjmCbPLZySAbxQO4QVklk0dX4TwMosNzPsQeyj/f/jV00z84u6wnn4tTaXWxKW0wZMU9F1HKDepNRdVnia2F4tZgKm7Iie79WcgDPXqZZX7fqKhNvdBLIvIO1wo1ypHgtVdRGDXBD8Q6jeB12YS5lZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280428; c=relaxed/simple;
	bh=C4SpxTOOX+p90aWONApoCM00oLK2oH/jZSzE8rUAj4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d6uvj/dH0CK7BVqSGppS5u5nf2c3c4KVzLVgI721tk180qWfQ2XFzuFJbkp6ljWlBCiHWxwiOSaQOYBukM6qtLhH7k4Qm0V3h9uRiSHsKoZOZmFrRY5fE7ds1r/Nn89RliFDgvTilqw+SXZxK+mYPsiAmTieE4ngLpiZb3zAg7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DwBFMy9Z; arc=none smtp.client-ip=74.125.228.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DwBFMy9Z"
Received: by mail-ed2-f30.google.com with SMTP id 4fb4d7f45d1cf-6aa06e51bc3so404970a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790280423; x=1790885223; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qyy44jhEy5lmMDUm2Z3Ant0w7Ak4jDzWxPvH420aZFw=;
        b=DwBFMy9ZevYNOE10PKKtfH3w1GJH0iHSeM5TxH+fCcaa7OckRwAlQiIxtjVarfpJ4Z
         4xLC9FawpUUA+Wkl/pB++WMLl8AnAba23ZbzXaeA/wQUd6pK3XICw0iKbkH7/uweNI1E
         xORBkfsZZTfCjEgrr4cGGdoxlI/BqshoJQGzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280423; x=1790885223;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qyy44jhEy5lmMDUm2Z3Ant0w7Ak4jDzWxPvH420aZFw=;
        b=cOIBeQMAXaPoRFPAFfaOFdlddRP0TZtARVnL9RJto0jPK5jYqL82gSH7CpkG5tSueF
         rhzwZCY8zOT/jykyznYzQto+PzIMH8rJMA3Pvtyd/jhnprAAmLmFcv9ORiho1xqhbAs7
         AL8elUCRjbS7eqJIr0ZoJlE2LFzWsyQDGe9r+sx8AS67HBx3dchmZep/EuoSN7Xjn8wY
         GalQz6RSqn6TOKXUdbzLuLMtriCLqX9a1ML3F57jYFxxLvhfNyDGmKiW6IY0X1ExilHK
         xZ8Im1Df1F/wyKdEYiCAMnGwu+yhKmxUoQfZV/g+kHLjrS6cnymOMPobVml4p8u8dAoR
         TxqA==
X-Forwarded-Encrypted: i=1; AKwUvBxe81c2/yDjgoil/7A9Rg2LG3d2wpoH5Hh7ky/gG2f6qiRmYHCGCRolv1GXEh8mUXnckRS0Mdt0Smx2wuA=@vger.kernel.org
X-Gm-Message-State: AFuF++kFZij2sc83ban97fToZ+zrnMhYV/1pXIAJbyN2tVfD8qGVSa7z
	VOTBv0miruQ2UvtidHe/tVS+repBXz2Q43cODr/rZf9+N349aMA7VuJYvipmae8Cu3Cdurpf+wC
	CHvml8z8=
X-Gm-Gg: AYBFou34zL2UIi2Lfk4N2Z78Pu8p36L+MXwLpN16O0unNnBKOW8L9lbdvyAQvLNbHCl
	2TV0rmLBvOkZFD3KTGL3ZExNfvt3usGgE2e7qHNucADDYD7mREE1/RahMVWdO7/znzCDODrCIgt
	VhLIZg/lKcD8PNBNap5Ak7TN4J720uLii/N7Pc8d5GZmj7GhzgdpwHEd0GRKInb6/HgJbVbDbwG
	j3dJArRpwbX4NyiyPtJ9ARGYU6rzVgL82Ty+tAIm/LmaOkD0eFXoszrqxp+rkS1AyFy4KWasYoH
	ciCw10t02b7zlxI+z7y40IhbOq662mYfUD/ULallURA9AeMy1BmKeo9KQclhaWlNLRfG1tzalY0
	fyWtTenqfqTVV1wUfBwUUcMXYXhObNNlapmqA00LHF7+CEQ3sVt+npyK3P8mwl1THbu3dw2F8fp
	WA3NpZZCLhrs3muSZ+9PzE7zomHnZBHjkWmr37K9c6ygmPuZNbh2Xwvz2rEIBVMusB3j5iuZJHp
	yEksPCKwPufpxmSUU4GHm4aqOIQV5l+OWA6+UEu0QQCGXhH
X-Received: by 2002:a05:6402:4390:b0:6a5:fbc6:cad1 with SMTP id 4fb4d7f45d1cf-6aac8f22fcemr3212874a12.7.1790280423620;
        Thu, 24 Sep 2026 13:07:03 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5972da6sm113948a12.2.2026.09.24.13.07.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 13:07:02 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so33213166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:07:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxItHF8uzHMw6u3Y2PAWui6hwwGpe17xWXzc/BSIqJzVeZxiqbNZlMOa8IRGzgMIGolZFGEmVw/iMPz2sQ=@vger.kernel.org
X-Received: by 2002:a17:907:94d5:b0:c26:1648:a060 with SMTP id
 a640c23a62f3a-c2ac249c6bemr320808866b.27.1790280421536; Thu, 24 Sep 2026
 13:07:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789239015.git.ilya.gladyshev@linux.dev>
 <ebd6540ad89a4bb80e2a62d00901b5c827315b66.1789239015.git.ilya.gladyshev@linux.dev>
 <DLFJL5U9DI6F.3QJP9YP0KX636@nvidia.com> <56e036665dbeb0a8f51d697220d5ed84f210994c@linux.dev>
 <570cf649-a8bf-4073-be71-207fbb2bef40@kernel.org>
In-Reply-To: <570cf649-a8bf-4073-be71-207fbb2bef40@kernel.org>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 24 Sep 2026 13:06:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh3LLDV2AMZn1PZcU1o3Na-BNcQtP=LPXouLKPZWaiRdQ@mail.gmail.com>
X-Gm-Features: AclHuK_dV8YPGJI0TEUvEYODnc_z16AdoaIsLG5kL3upeb_9xIleI71LaAxD0v0
Message-ID: <CAHk-=wh3LLDV2AMZn1PZcU1o3Na-BNcQtP=LPXouLKPZWaiRdQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] mm: implement page refcount locking via dedicated bit
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Ilya Gladyshev <ilya.gladyshev@linux.dev>, Zi Yan <ziy@nvidia.com>, akpm@linux-foundation.org, 
	andrew+netdev@lunn.ch, apopple@nvidia.com, artem.kuzin@huawei.com, 
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, edumazet@google.com, 
	harry.yoo@oracle.com, hramamurthy@google.com, ivgorbunov@me.com, 
	joshwash@google.com, kirill@shutemov.name, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	muchun.song@linux.dev, pfalcato@suse.de, rppt@kernel.org, surenb@google.com, 
	vbabka@suse.cz, willy@infradead.org, yuzhao@google.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Sept 2026 at 11:52, David Hildenbrand (Arm) <david@kernel.org> wrote:
>
> There needs to be a common page freeing function that dipatches stuff.

I think this all needs to be entirely generic to all pages. Agreed.
Everybody needs to do it right.

But I think that in the scenario that Ilya mentioned:

  Refcount operations as follows (FR = FROZEN):

  A: DEC 1 -> 0  [ page_ref_dec_and_test() ]
  B: INC 0 -> 1  [ folio_try_get() ] => success
  B: DEC 1 -> 0  [ page_ref_dec_and_test() ]
  B: CAS 0 -> FR [ page_ref_dec_and_test() ]
  B: * deallocates via __folio_put() *

  C: * re-allocates page *
  C: DEC 1 -> 0  [ page_ref_dec_and_test() ]
  A: CAS 0 -> FR [ page_ref_dec_and_test() ] => success
  A: * deallocates directly via free_frozen_pages() * => BUG

the big here is that the de-allocation was done not from the state of
the *page*, but from the state of who finished it off.

So that

  A: CAS 0 -> FR [ page_ref_dec_and_test() ] => success

is not a problem per se. It's a fine case of "we had one single unique
final free".

The failure is that A then goes on to do that

 "deallocates directly via free_frozen_pages"

because A mis-judged the page as having the old stale state that it
had  when *A* was using it.

IOW, I think the soluition is either:

 (a) every user of put_page_testzero(page) agrees tro do exactly the
same thing and there is no difference between how that final
"0->FROZEN" is dealt with, so it doesn't matter that A is freeing a
page that C allocated for something else

or

 (b) the CAS 0 -> FR state sequence always looks at the *page* to
decide what to do, never at the caller state (ie A will look at
whatever C wrote when it allocated the page to know how to do that
final free).

Hmm?

            Linus
