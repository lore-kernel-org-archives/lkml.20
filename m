Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F74B42AD8B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175058; cv=none; b=kMy0Vv35DXiijekVWz5Kl4ffgeq8ecWxuyW0mw+ompyBddujomorZWkTRKqUsC19TQZiv5D9gEYImMlF84BERWV8UvCHDzLCr3anYr9tbFhpxcKtnL9t+X1JNbhFLtflHkLaFwbAYDdQIWWan7DLW1hPlKh1F9F3XY2NzIc5GpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175058; c=relaxed/simple;
	bh=bIepsGyPsDjDb0Ip+H9KtkM7Sr8wz3KXlJWJMjG+7aI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=JMGrG6IUdkUTOLTaJ5bxWLWPKFG/s+vHtmOVB8pZt/9upju5YZbZGqFN6zvKcu/8+tMf0BjirBKLrsWRnuKABdlONVWrQ5+Qn0Vttj6nTu45CMZXNGxAo/44y2qNxkEiZpYCneNwMKYWb03e8TYuRtpm9Ql/xEJRG6zb1msxV3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5l55XuL; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5l55XuL"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-89a595332c7so142829b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792175057; x=1792779857; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bIepsGyPsDjDb0Ip+H9KtkM7Sr8wz3KXlJWJMjG+7aI=;
        b=b5l55XuLf4CP3BRvUqG+XkMBAHbn4cXQ/jQVbkSRkBEkPv4QIN/8I4DuigTBnZ0cs3
         klUirn4hyw3Jh0auzmAHtsqQoeS1tlU2YD1kVL6CRw9RghaU6lLmWuL/PCIyy4/+NQEx
         0haL5wH3moPytqEENOkCe415nZUpbJ17TR+DV8A8EDbyqEj+gRQMBtfR8ipiruRbb5a5
         KUHtJiXaHT3/evZVSCiAoYQ9UoTaGudRW0MsAHJd/+ixtTOZJgiQUWWTe+OsNhvqgWcZ
         Q4CgjWz8Us7UP39g5MQTE15sioUUDj+rS5d82PMNvQgzF/UEAEG//CwwxOCcVvKkAuYJ
         VKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792175057; x=1792779857;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bIepsGyPsDjDb0Ip+H9KtkM7Sr8wz3KXlJWJMjG+7aI=;
        b=ngkP12NzFrkWJwpkQu5NF3Y5TvM6pm/Wc4QsWyumBPmtfcK6huO0zA/Ppe2xGB6oUQ
         BzSYuGy7pJLS1kML7e2EwXQGij2ppcCB3qxkhNT5+ogpRF8H4wh1skcNZa2rLKFfXVek
         x43Qm6WoyZwVGdr5+WWEmNTVoVx1QZDuSfrYn40O1T5wLxXDt6kzJgRyRj5GdgLvvBx2
         KQemOD9Ln+rVyRtvvOxOv5P2S59zQyH8fgYi9+OQvovr/O9HuK3TtK23Y2eYbQ2CNLTt
         3doTEKowjfwZ1Tqq6qMBuE+MOxdZRRRIq6Q633cTmbhas62f90KIyZdOjxBmiMbzq8D5
         GWhg==
X-Forwarded-Encrypted: i=1; AKwUvBxqH9mfEcljTlrQwR983imHDSR5lfRuo2ol+/2Fqw0xQHByCz7PfIq6e6IQOGRs/oP4e+2PnHxkNbUnwzk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvZuvEMwj4X4ewZ33iRZDbk/jtrcNIF4ASDi7b/xrMpyyHgEei
	YNassAPC0WWeeJ6/EkeRa2w3cgDEqZawswR97njtLF9ff0hCoMEdR6Pp
X-Gm-Gg: AYBFou2afwpG5uBQ8e7JEbBukIS61Hnb/3YMKy7dmNyrZKY9UyfCD+T4lWMMP3fDSWc
	tLnhQV65mYi1EO4wlbzEJrPfSbl5XuB91JvScyZgkhbcAle0DtbRd6/dvyl2rS0jHjMMLIeABzh
	JmBlpA+TebMzaU5LAtrUxWHy0ZzedxtTsqFGNMHYRcz49K6ezhQ1TLodUXZehngCz+uDJ1ZmHFa
	aSMMkCSQx2Y+Oe+91LcLyiD134ra0yIHVNGZRr3rN3ZCcCy6RNnZNnDToT0uzbTwkaG/PmHK/zM
	fyDYush+5OMswhcfLHtJwOVLNIFC992Y3TA9qvHC7aBsQ7mLCp98psYDGx/O+hnehIVeM1HW8o8
	dCkc1mpOl3nbeajW55o/8qfsrUjccvUTEUm4LSWPktMJnmhJKhffJkpRXu8AvnRpQ4M6bl39Ilu
	mzh1ArZKbuSFxXRwBfQL5WCTnw24kWd9rM3e2BkAvsaKuCgJuLlTfSkcJ/2m30Vw6+7wcq84IAv
	DcPq5VYCNAjUYOfnEmBs75jk3tRTBkUGdtak9FG7eIjfsFUtYRgpR+zaSBHCwLZ2kYdwOqj8IHa
	vlg=
X-Received: by 2002:a05:6a00:4106:b0:87d:dc3c:1b5e with SMTP id d2e1a72fcca58-8a04ba2601bmr396865b3a.26.1792175056503;
        Fri, 16 Oct 2026 11:24:16 -0700 (PDT)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f56c8cf81sm1506688b3a.16.2026.10.16.11.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 11:24:16 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 18:24:13 +0000
Message-Id: <DM6H19P1797J.2QYZAQAOI9FTN@gmail.com>
Cc: <workflows@vger.kernel.org>, <ksummit@lists.linux.dev>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Mark Brown" <broonie@kernel.org>,
 "Theodore Ts'o" <tytso@mit.edu>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Leon Romanovsky" <leon@kernel.org>,
 "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>, "Thorsten
 Leemhuis" <linux@leemhuis.info>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 4/5] agents: add a skill to find other instances of a
 fixed bug
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Sasha Levin" <sashal@kernel.org>
In-Reply-To: <atJnq_ssIAGK-OSZ@laps>
References: <20261012213452.1863248-1-sashal@kernel.org> <20261012213452.1863248-5-sashal@kernel.org> <DM6DXZJSMPO3.J5PONDJ3HWNP@gmail.com> <atJnq_ssIAGK-OSZ@laps>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 16, 2026 at 02:06 PM Sasha Levin <sashal@kernel.org> wrote:
> What I had in mind was the kind of bug our scripts/coccinelle/ rules look for.

For kfree_mismatch.cocci kind, yes. Each site is its own bug.
But the other example in the guide is "a missing put when leaving a loop".
That's iterators/for_each_child.cocci. It was fixed one driver at a time
for years until for_each_child_of_node_scoped() made the put automatic.

> I agree that fixing the interface is better, but do we want to push all these
> agents there?

To report it, yes. The skill is read-only anyway.
Whether to change the interface is for the human to decide.

> So I think it should be a balance. When the skill finds the same defect
> in several places, it should also ask whether the interface invites the
> mistake, and if so report that the fix belongs there instead of handing
> back a list for N maintainers

Makes sense to me.
