Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70073FC5C3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790289092; cv=pass; b=ZFGPZm4ATdDV0jTeR45lubfasMPqn6l0/0O9OK4HJ7wGcy2MtN0hh3qWLqv2pqadkEsN1CsySQNFlXhhpdm0FMIkMeZ+lGsN+1gQvycoeO3sbayxdFrsoOS8MTUCJCi3iTsLAfQmSmTwqMqC96NP9sLEUK/4Hr6fDylvaLE9r8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790289092; c=relaxed/simple;
	bh=QyHE3recU+YgckuL/EubHuVec7rhNZz4z30xRjcK4e0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nru0Pvn2JrDORdovFwwgJbhFSHvVrP3WM2E9BXANon8YjeKucd0FdsBD7aVr9OyKW83KXVRtYaN9jSOwOcD59Sa60Zh95PVUuiZR77zbL/p6Qo73e1ql1yOEbzq7mSKOr4f9HdJu1r/EJP0T6LCzwSJ2Rue7pWnc2c60kyEgOUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CvuOtUQB; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CvuOtUQB"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109f067cso26960085a.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790289089; cv=none;
        d=google.com; s=arc-20260327;
        b=Nlz8NOkcAPrnzNncB/yxKxBl2PZC56nxH48+/ou0rt0xWJ7d985w1VldqKizp3NK4Y
         PgCwFPH6lSesE8ucsoKY9H6z7yMLt9wfaPQhZrPfqj+KZkjOHErAIX2gbZn00lo3WWHm
         8vOtlsRYsGaELNB8ge4Q+cWNCqAzWrNOH5UnwQa0ea7F4POCWrBhqpQ3v0npcDjVdbfe
         oARtIzyKWnFdZJ9wRxcOft17Xn3r/Rq8XMPN1t6aqN5tsHszZSoGqNxu5tjewK3iJA2i
         itxFTAKrmUqFydnarxhTka4MWC6+/N7JLWXRAvdoEzhFWtLUno23Lg1Vz2wCietnO6ah
         M8jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=KLxQ1V7eKFjM5hpU7Dk8oYI/it/LXUSsiWfbILSfCAs=;
        fh=hSPYbdLzf37acxeI4L7Nq9MNhsEUqPK8HBt2OsXFxiU=;
        b=D7xXFz6af9nZc4oQYnT9CSYRVmdGsdDg0JKM4sKZLnQcy7nPPmxc5lHKSfO2ziOjzx
         vCygBTpABbZsJmL49/4OruAQZzMZrrU0jj+kaJ0a8x7esEum18ElmCCyPkFSYej1mdul
         Ju0/55ljB508eqXejs3eM2TQmkigjTcXWBsKFByg5weICOTty71G6nup8zunnn+kB6wU
         N1h5JDOnNkoGaLkS1PiFmnVpmXWyvMSrQi7ACVEwddOJKi4R95aQauzRoNTnrI13AXXB
         pgcr28DikpkPpJjbQFHuHZcHhufDFJvPJNmi8TCyGGakgX1OzuWqolzOkGuY0V7koB+9
         cQpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790289089; x=1790893889; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLxQ1V7eKFjM5hpU7Dk8oYI/it/LXUSsiWfbILSfCAs=;
        b=CvuOtUQB/B4NTpiIDVO0oU8xoIsonreGdXZVXw+78v7q5YrW8DRlFGYMCN/VBUc8/o
         iStJentZaoI9twayKt9xqPL4Cw0lEq6J8aWdENNeqkW5iOMhDcHPUuuz+TEP/dzXM+XD
         lOvy2Fxusw/H+NQynYSRCFYhcccPNiOXt0Dquf7WYm9YFLY9RBjgqyEI/6jCln8qG0a+
         Zesms6H6dhFYDz9REiTFRfRUEVG31ao+j/KiuNLF1UOKUsn9vGO2efLveO0xpbRX/6fG
         xoJF9lUTMvbWYpBW5X1sPYcJqRkMf5UvAzUv9NXVa998IVRHpFfx7HABfZ4TNWuvN8oB
         7q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790289089; x=1790893889;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLxQ1V7eKFjM5hpU7Dk8oYI/it/LXUSsiWfbILSfCAs=;
        b=rGHNMoRU+5TGhcc7BvTfKpy4sViN64T0Gjf0HF6WXAFIT/5Bdnna76KRg0H2DmPqeX
         DurxVfuK/2xhMxzbT43xhaTXTwCYXs5Pjbv0PKrjeoGT0kbPYEkZWADJDIr8YteBOCE5
         n+WUUUvZl/d5zQOTiiflgFhEu3jWskHw4j7uX0qljFuQJTBbIy4EaUqgfAucaZu5N/YS
         WAQqcR58XP+vaaBhG9FoIGWNqI+hwSMsuHtr8vuFl5BI04oCWbZpNujwhK4I4ZzSe+vP
         BX4RnSSzCwngaSmyKzX3umVO2mltWqHFomBxo+N8vBU1QTv9ZsLsOXhr4jXBz7yb4Std
         /YiQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+shIIe1Tt5aAsh4d2UiXFS9CrtwUh42ek6jxQKLW0CA/L4tXOsuOiDSgxrGig6C30gn02Epk88nAleTc=@vger.kernel.org
X-Gm-Message-State: AFuF++mRFcaQ+MTb6XcfImXmfetLzZNo04U5rl095EQTBS0Rfcgcoaji
	a/X+l6tWNtPxWA/3nDJ53sWteGFG7Lm/X7PYC801O2j1xg2cCIQ+2W3cGkQQi3yfmP/l1FEeUfu
	03IOtr4dQH37RZIGV6sVsALaB7GqsvxA4TCZqfB/8
X-Gm-Gg: AYBFou0e6oNd2KoYIPhOI0wGm5MKqmHUG2X8btEJHaAim0dQaWwpSKllsQJXj++4O+t
	8Xp2eddXja38lzcV3zjohNlDUfFxcX8FPwJcHf/LGSaWuZmWu1Jy3CQsfQ4JJouhF9bzdLvbSsW
	70YumWsQ++CimNMbpMSfQLw/doRBOyCbHBpkdktBY48Y6c9XFvtpKJrceMk7Zl3EreGFbdpGipC
	K9sAfKHvswil/Fv+Y6KmuChm7M/hXOlBcYv7say5k8dkH3ZXvgKsJW31wPlvhPewrSrxtNTonLm
	tk7qu1gAXpnfjc2/Z0ugrO7BSyY3QzffWIungcceQEs/B+NsePJnqY+un5+fUUhBjrqvxXyaFNW
	Eo59iobIt5AUGHqR9VNkCXDU+gZVDq4nUU8QFKZEvBg==
X-Received: by 2002:a05:620a:2b93:b0:936:eeab:307e with SMTP id
 af79cd13be357-93c43cc5676mr141474285a.9.1790289088659; Thu, 24 Sep 2026
 15:31:28 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 15:31:27 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 15:31:27 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <179028368162.2007072.12117327378679658047.b4-ty@b4>
References: <20260910-gmem-inplace-conversion-v13-0-dd6fbf94f4e1@google.com> <179028368162.2007072.12117327378679658047.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 24 Sep 2026 15:31:27 -0700
X-Gm-Features: AclHuK8DxWsVWtzA-dbMsis8Esd8BT_dOvi97JucFF4AgqprHJknTuuePlOITb0
Message-ID: <CAEvNRgFpMwduvHPGJ5fLoVPr_iGn=ELzY4AcMGHESC6CkMyeTw@mail.gmail.com>
Subject: Re: [PATCH v13 00/44] guest_memfd: In-place conversion support
To: Sean Christopherson <seanjc@google.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Randy Dunlap <rdunlap@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Fuad Tabba <fuad.tabba@linux.dev>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Thu, 10 Sep 2026 16:55:26 -0700, Ackerley Tng wrote:
>> Here's v13. Thanks everyone for the comments and fast responses!
>> We're now at ~3 weeks to soft-close at 7.3-rc5.
>>
>> v13 is based on 7.3-rc2 and:
>>
>> + Hugh's patch to export lru_cache_drain_for_folio()
>> + Another series [1], which makes kvm_gmem_get_pfn() NOT return a
>>   refcounted page to KVM.
>>
>> [...]
>
> Applied to kvm-x86 coco.  A *huge* thanks to everyone who helped with this!
>

Thank you so much everyone!

>
> [...snip...]
>
