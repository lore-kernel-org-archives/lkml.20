Received: from mail-qk2-f11.google.com (mail-qk2-f11.google.com [74.125.230.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E2657C738
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.203
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965671; cv=pass; b=bAun6RPWlDxpQ3LULoDGy0lJI2DyZfK5YkHtQdfR7R5ULgT1YFRokghQUFc+ASZFPtblc1ejCGEQuGiZ2BuXhykBrcReaK7tFFkk0+y52rH7Ze22xQ5tuarxObFa2DIVgPYJhTrGXcWNhxTE7tXMuM5CUBla+2Gb2WOayiUa6XU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965671; c=relaxed/simple;
	bh=2+LQy41VBaoLXKZAd/GXhewDcJQYQpQ6hKJnhk5gu+0=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Raz+fQQu5ZXHkWy6wdZy3/Iw6YrCHktz00pZxhjI8k7LnCRZ+eTZTcQR4pQZbLDO0C4fDdMKZzlAgo0THTraB6s0M6hIVvvcBIMtlxhMF+vr/cqnL9DIU7eUhbI21TTuznFDea0ymCkW/rSB7q510xMaf1yRr/CJQBidDHy3YWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2wdmlu8; arc=pass smtp.client-ip=74.125.230.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2wdmlu8"
Received: by mail-qk2-f11.google.com with SMTP id af79cd13be357-930914e4fc3so320756885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:54:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788965668; cv=none;
        d=google.com; s=arc-20260327;
        b=sBlhwBNnGA87UWZtCrJdBpvPFWTpkb21C24LgXJ9fjQOT74WIbIXi2p6K5BYuNjSAm
         Cn3rwSai8OV1BlBVvsrE6fzGGxLB+hdJp/WORBZn8SO2nErZBSbwB0rkm5W6IuQsPYoh
         sAiNxd9SQ2KcfsfFLzB3bKiHWLilx3zT1LYr8sztHZPMJ1ORoFoRybwMs8BtTUJL/GBh
         8h3f2s9Kvamh9A/+PNBG8M2Yc7qp/PrzwX/rQTVHPcBGiVTbdn0QB5j5FF6bfLcfvfop
         iwXbWmJsWXfehI+MQMxfGwgVWd3aIf73nXan6GwkiIELnK2mG3yDDvjfNmhxEzXMpc4T
         rdpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=+87EHy1co2pXlM7ySnDj2tBNxv7Gw6474K+toJRCPIc=;
        fh=HNjkCeGtPrBL1HPn8K9LmBSai6Dms5ck613PvRjoxjo=;
        b=gowdf41MMxVYVY/pXHn/cMVkijWYUi0HESowYYGDWJxXGncrnTlEP+59IeGjt2RZjB
         yI0z32nZ/nind36GNpxztqlcEej+UIS7FB1ITRHlgy6/G/tWnGDY0yvMeWrnUSKivlBs
         Omy4FCxruV7i+1goHWSSw1Pr+m3EtKUQmA3f7TASafXZh3cQCK1Ho9fUg2BzTRj4QXqZ
         U7TD4jPUQa0VY47kgsdUsEHJHpJpkjxiCOBs46N45ail68GswOrt1fgQaWfLz4F8PVIw
         XIYnecwNE4zGr2W9EzmLlioChXRrHS24EUUAVsfhK7DsgCt+Dk7ERca24Sc1mMEeysrE
         YtJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965668; x=1789570468; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+87EHy1co2pXlM7ySnDj2tBNxv7Gw6474K+toJRCPIc=;
        b=i2wdmlu8tsC9gv5D9GVj9LtVXrwOzrPo/hgI9MYZU/2TNq3CsOTGPmBVJpO73oAiZE
         QvggmjsiF7ZDRZvZd2RkugttjDNoyQ5NJ3Y96Fj9CApOJ7wJ4ZIAwr5d1Kc9tu9JglBw
         4RCVgvYrKsiNZxEZ32TYCJetsVvEwFwv5bZ428jznYw40HU/ExfcB64HUqGVEZZwJchQ
         6w3IbdtumJwqMHapqnyUWfZSAaEAyy7cQqNhDPRY5zH7v8JvbQuhBCRvTLRXUnpmZezm
         PZIBZjEPlCDvfJJpOK54KccuqvwxsFyvmZuRo0hLdZzp1ETLa+drLPux1tiTp3GJBDtU
         7qog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965668; x=1789570468;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+87EHy1co2pXlM7ySnDj2tBNxv7Gw6474K+toJRCPIc=;
        b=tFz7qeNYlwwDEnnDbDVALTYQtc/eMOYi/AmTxvIYXmG0wSSTrtQi60nw5cnnUp9/tr
         zIZzMkAFfiKEoy60yl3cQkojDkQlY/697yNCDWEXxFdoe6yuQdBtb6P8fzE1qIDBaVRu
         HwPk8UEfF8oemAe/rPpXW1UgZ9UVC7EsKeWZ//2R1zpqpjBDCrH4Bt36yJjUOuwNqnwe
         isBrAWoNAFqGfbGT0EbxzoxxCvH2QDQXqN0NFClof31N41hwKxVr902qunHJHZ0hs1ge
         +oIdgg52UntBAL85YtCrBeHWCX3zVB92OPHMSo7tim+vBEeePsbaRjHjHdN+4RCK/bmc
         l7lw==
X-Forwarded-Encrypted: i=1; AKwUvBxToulpq1ANVp/Elf0pe9xrKk4QgmH5cAXbdGEgvHZAh+Mz1ywiyC3aPNOnMsaoucJk9TLJeUkh33PtP88=@vger.kernel.org
X-Gm-Message-State: AFuF++l5oA1QH9mMDaZVdh/RofTTfJVIYLivazfSBxYQl4IRwulES3BB
	RSAfO/DkZXsJBb/hPhjQ2sKZfwMr2McuWTXjuZiZgI8FKHcTe95qsu5R/5CBHDas699iUjjbriX
	FxfPJnZpQh8jDTqLheAIG4q9Wbdhqh8E=
X-Gm-Gg: AYBFou3joy6nUY5gDuNH1F/Ud44x/7sOAiwHsDJBiumZXewf7DuwwLuo4rD4oCRt3/w
	YfkVM6b16FEmb9uRLbZK5x4Smet9ZEc3E1xSoyLib8OfTnl5UwM/r7s1Tktv7EzTBp9Ax5bmm88
	EizVgXJ9hey0aULl8Se+phMLjqQXyzmstxrkY+UnMkO7i7Uqfc0MBfgEE04GU2eq5Q6L+aATA9j
	uD5T0ZBCAgImT2gn5jnzP833HWBJwOssuo6z6SYK1dXszu+zypBTXskJX2FGhB6Ct3uUQFo2XC7
	uF+W1tDXr+r/AOAVbc++y/p+RyAKJ/PLqHrt8yAz5tmiYpazoroWTw==
X-Received: by 2002:a05:6214:3bc6:b0:8f3:cf36:15ca with SMTP id
 6a1803df08f44-910c8552de2mr28530296d6.9.1788965663921; Wed, 09 Sep 2026
 07:54:23 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 10:54:23 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 10:54:23 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
In-Reply-To: <CACGbirSdR30=YTPQGN-=202jZqiF8gBSewhq+K_fTSNpq=DMhQ@mail.gmail.com>
References: <CACGbirSdR30=YTPQGN-=202jZqiF8gBSewhq+K_fTSNpq=DMhQ@mail.gmail.com>
Date: Wed, 9 Sep 2026 10:54:23 -0400
X-Gm-Features: AcwNN1WLFkJxZiXjMeZLR_cyAMBfiX7lh_2ngWCAdTCfWBnsc8DM_11bZhuFLIg
Message-ID: <CACGbirSVuuwVFKOtdSh63s5ktbBwkC2hdkD3FBG7ndaAuFyWbw@mail.gmail.com>
Subject: [PATCH v3 RESEND 2/2] selftests/mm: Only prepare ptrace_scope when
 memfd_secret is selected
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joel Savitz <jsavitz@redhat.com>, 
	Tianyi Chen <diannaaav@gmail.com>
Content-Type: text/plain; charset="UTF-8"

From: Tianyi Chen <hi@tychen.cc>
Date: Tue, 08 Sep 2026 11:21:50 +0800

The memfd_secret setup clears ptrace_scope whenever its test binary is
executable, even when a different category was selected. run_test() filters
the test invocation, but it does not protect the preceding setup.

Check the category selection before entering the memfd_secret block so
running unrelated categories does not change ptrace_scope. Keep the
existing executable check and the behavior when memfd_secret is selected.

Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 tools/testing/selftests/mm/run_vmtests.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh
b/tools/testing/selftests/mm/run_vmtests.sh
index 9e62ab4c6775..9bbef9410ccc 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -370,7 +370,7 @@ CATEGORY="process_madv" run_test ./process_madv

 CATEGORY="vma_merge" run_test ./merge

-if [ -x ./memfd_secret ]
+if test_selected "memfd_secret" && [ -x ./memfd_secret ]
 then
 if [ -f /proc/sys/kernel/yama/ptrace_scope ]; then
 	(echo 0 > /proc/sys/kernel/yama/ptrace_scope 2>&1) | tap_prefix
