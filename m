Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793339581;
	b=Vxbx//87C5pvpC276MhHNTMOUGLx6jenvNYoG0gg8YeP40rAR4zoGmQuHmkawi/eim7I
	 Pk6FMnOGSCDGpasZyoZ6N10/1llWpAs8Lqz0YyRUxGQdzbTKUDb5J9XMV8M10AkGO68ZC
	 wBRhiU+4evu2ukd4FhYYcq5xgmOv+66v+Asv3U7RkvG6jDq2ePRyT8uVBQkIxw5NG5pdv
	 7h9NteAUQmzrAlzISGIZeTcDZqoJlTYL4jEhyh8qgNwvaOoXJFXoSi0FbPuffy6tXKRcW
	 +5Az9A4sJmRScdskMtOpEZh1qY8DbZNmMUs2z7oTNwQrErNFoxdNBXHKZca/VVMV+KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793339581;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=dFiXQ8/+LPXM9hQBfy6DKJOhJL1VeVJ4eXk+TVwAEKI=;
	b=ZYy9rlo+9sgCRl+gJQ9UfvnvR0lGULDcmlCaHPaMB6Wy1AD0QUpjku+Khq9eQqdK5cLY
	 ixREwzCMjZRFArk2h9LRU2/Dq7YDzqBDiSKpQ3Xjt/yFE+v1+8jXt8mnMFBiwmeiIF9aC
	 nX20VLd4u4MfXgmBbhzsS8LZmUfhM7S5ckpqIK2ULKt5rLsThNrw6rssxxjkCePqJOIPX
	 +S2+LNG/E6vnzR0o7rLlfA7SA1UmFS9XnxVu45nsLlo9w4G9VQSgZvuiEL9h7S2JPb8EW
	 EbzYbDB53mS+k4jUHlUvKX1wcCDb/ke2WFAm2ziu3aTgLFR2kqqbKk+E4zxAyscMyew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=xGbj1JhR;
	arc=none smtp.remote-ip=91.218.175.221
Received: from mta0.migadu.com (out-221.mta0.migadu.com [91.218.175.221])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C222E606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C222E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=xGbj1JhR
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tOyBd8nMtYVm54t/2HyXVQ/y3oISDTBaPm4PD2Fz7Fo=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793339578; v=1; x=1793944378;
 b=xGbj1JhRncHXvbRYUmp106lKqsH7CeIW8N7WgQpEHf3MGhqtoeHPDvtLRs6JO6YLpaHflXbT
 rUnVisnb45uFPoJhXr2ZA+tMWpyfaFKu4HjZUXJR+5b2FRBDzgIbUkpWjFve2vCr3QEAAedSOBM
 JKQYR5nq0Ov5qdLaW9uQz2beu9xae0LFAFsLDAl0kl3f8FCh6nYK5Akri2ILH9IS1ZZyswaV3d1
 08VjmKw7z2br1GhOHRV7w2NTbFXe5ID1p21CrudGoxvWnWgBt2RQaOArHfqxXwxYQcdDaCnBEWc
 FfWk1w9VvrDhYqM+vZItOHxqCk/rfti83f+Vu4r/1ctvw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2d0467c948db7858;
	Fri, 30 Oct 2026 05:52:58 +0000
X-Mizu-Trace-ID: 2d0467c948db7858
X-Migadu-Flow: FLOW_OUT
Date: Fri, 30 Oct 2026 13:52:50 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Weijie Yuan <wy@wyuan.org>,
	Chen-Yu Yeh <chenyou910331@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs/zh_TW: drop unused enforcement statement label
Message-ID: <auQwssHcQiM09SDd@wyuan.org>
References: <f851e36f0ca9db7a0f71200964fe97a2efa85c13.1793265072.git.wy@wyuan.org>
 <d32825a1-8da4-41f3-964b-8854618890d5@hust.edu.cn>
 <auM4XND4sgE9kko_@wyuan.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auM4XND4sgE9kko_@wyuan.org>

On Thu, Oct 29, 2026 at 08:13:21PM +0800, Weijie Yuan wrote:
> On Thu, Oct 29, 2026 at 07:50:43PM +0800, Dongliang Mu wrote:
> > 
> > On 10/29/26 5:26 PM, Weijie Yuan wrote:
> > > I happened to notice that there was actually an embarrassing label on
> > > this page [*] that had been rendered in HTML.
> > > 
> > >   * https://docs.kernel.org/translations/zh_TW/process/kernel-enforcement-statement.html
> > > 
> > > Therefore let me drop these labels in process dir but leave the cleanup
> > > job later.
> > > 
> > > --- >8 ---
> > > From: Weijie Yuan <wy@wyuan.org>
> > > 
> > > We can link to these documents by path, so the top-level labels
> > > do not buy us anything.
> > > 
> > > Drop these redundant labels from the Traditional Chinese process
> > > documents.
> > 
> > Hi Weijie,
> > 
> > Removing these labels breaks existing zh_TW cross-references. The patch
> > deletes 25 labels, but 17 of them are still targets of 25 :ref: uses.
> > 
> > Dongliang Mu
> 
> Thanks for your quick check! Indeed, there are many of them being used.
> I'm doing this stupidly, sorry.
> 
> Then I'm wondering why 'make htmldocs' did not complain about this..
> 
> [compiled again..] OK, that's because my machine stuck for a moment.
> Sphinx did complain about this, ouch.
> 
> Anyway, the actual reason of this patch is here:
> 
> > > diff --git a/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst b/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
> > > index d54d20529294..45bb50fd1e6a 100644
> > > --- a/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
> > > +++ b/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
> > > @@ -1,7 +1,5 @@
> > >   .. SPDX-License-Identifier: GPL-2.0
> > > -﻿.. _tw_process_statement_kernel:
> > > -
> > >   .. include:: ../disclaimer-zh_TW.rst
> > >   :Original: :ref:`Documentation/process/kernel-enforcement-statement.rst <process_statement_kernel>`
> 
> There is an invisible U+FEFF character before '.. _tw_process_statement_kernel:'
> prevents it from being recognized as a label, causing it to be rendered
> as plain text in the HTML output.
> 
> Will handle these issues soon.

Hmm, now I realized that the last patch I submitted actually covered too
wide a scope. The English originals still use those labels and
references, e.g. ":ref:`development_process`" so I do not have a every
strong standpoint to change zh_TW which would make our translation
inconsistent with the original one.

Therefore, here comes v2 which is only aiming to remove that
embarrassing label.

-- >8 --
From: Weijie Yuan <wy@wyuan.org>
Subject: [PATCH v2] docs/zh_TW: drop unused enforcement statement label

The tw_process_statement_kernel label has an invisible U+FEFF character
before its opening "..". This prevents the reStructuredText parser from
recognizing it, so the HTML output shows the label definition as plain
text.

Nothing in the tree refers to this label, and the table of contents uses
the document path. Drop the unused label to remove the stray text from
the output.

Signed-off-by: Weijie Yuan <wy@wyuan.org>
---
 .../translations/zh_TW/process/kernel-enforcement-statement.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst b/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
index d54d20529294..45bb50fd1e6a 100644
--- a/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
+++ b/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
@@ -1,7 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-﻿.. _tw_process_statement_kernel:
-
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/kernel-enforcement-statement.rst <process_statement_kernel>`
-- 
2.56.0.385.gac671c819a

