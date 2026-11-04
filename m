Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793818930;
	b=GIX34Bo8D0bSVnzDpctD09F/Um7vmjhdJnBMXtnu5PxKcAYEu08xHRxi35Ry3eXl7ThJ
	 0bzcRw43VtRO9gEbPSjm7lR+moZNPolnHpBuLLWWNvr0mhNrfl3CRSQPTktBbrFgJySbj
	 sx1fXEJxSTMEStWUsfa5zBe/mjBdEIUFTJLGmN2C1quYubLXGlqQW+Sbj+n7kPdnvoisT
	 CusW3n0bJ8OxpBeVkW5qaMBRhBuRfqEzgELp2SDFXXQtu18vMeoS7ey+BQykV4lLdgk6Q
	 WILN4i/4ykWqplt+njp4zeZYgGxqtCG10AlIaZ5oJJtooXpFiJLhHD7zMtVuEX6t2dQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=9m7RVHJoTNX9vZUelgq/zfkDObxm0i0TSOz7tgsuBTc=;
	b=s6ADaI8VqOKVNeDrx5LhAtOzbcLL2F03SohpdZ61juoV/2+NqwAHU3uUh1SC4v8fHvuu
	 ZXNiZy2yXz0BCWiMgZSvvP2gf4j9HFUbz7lLzEzOBDmEQ0+77J1jlzI5sDHIPZtVUTTWq
	 8Cdv9Bh7ICqQtA3LVaSShfepIMrBAaaWJcvHNYMv/QggGDlg/oCe7eQeY7rpyb+Q1BSw3
	 j3aUf5Z6L+EBczERbjX0tphat4SDH4wOv7okk5ccdI7OvrpE5JLdcW/8XJvnrWfJpPgF0
	 h1w/6hTN2MYZ3KyJzULDNCqewXmze3TaLSb3HX1Kff3ZTmq8Pa9z61BC/CDsS9XZfzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CdRdbetE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FD4606D80D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39FD4606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CdRdbetE
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ed1f1a7695so2234985ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:02:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793818929; cv=none;
        d=google.com; s=arc-20260327;
        b=h1MzaCFRglIK3isSWbRZhm927kD1LUAWCmilQQ4A7VMTIrYqOafat57pgVUxvgp/4E
         XJ+0KE2lcHFGfVKaDZWPSVyOh3psDQRnddv20HnrApJ5QbvpBUqzpupp+Ne5FPhN6x/o
         5xY0sX/7HV+i6Lk128IlHVcB6J8bEdWllezL6y6u1E6FQzJE9Vfy0/1i+5qroiIqlGoA
         nZi+7OaJ243FiTPswfFvX6XWIY/rfB9YeLFe68OMgyTL3/CkUpLenMV2jYONc/ENH7vs
         eNMgpl8YWFF883JcPjDlDWM5hOWcKcsEOken6bvJs36noExgUk30HmWZ2NFrWL9h/aQa
         h4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=9m7RVHJoTNX9vZUelgq/zfkDObxm0i0TSOz7tgsuBTc=;
        fh=afQVXXNcC+kZXT76Dao3KPUvEG4c3qRiXujaGTjG5tU=;
        b=AjlwBU+f0gZs/Ejfs/RwZFO9bv3YWtwdZAZpEvJG3VYrKFxhUl21PN+klB+rgVaA6z
         dSAdA1ecWF3yjOuwX72qz3GJ5doGe44mreBXW1rQa4wHMZWDTRyY500Qv+ZTEivj/t6M
         V3vQPmVcjgbo/ZdjqsEZAI7I3/0AV1l69PgqRJSx8xT8qMNDbTu5Bg32O8zoWk8avFk6
         ATtlV0Wsvi0n6WRnzv7sL/dk/z/4ONFBr9vJb/oMq51pjRVbilNS0RNzFz1njDoZGot3
         LTEJ9X3dOq8O972eo5T/1vgwRJ9zIpFLWsfdJIwE4COpA/J2b3aT2r4ib77pazWMn7n5
         iGqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818929; x=1794423729; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9m7RVHJoTNX9vZUelgq/zfkDObxm0i0TSOz7tgsuBTc=;
        b=CdRdbetEYyCXw6V7sgo0JOynm/w8Nv3GkCBujO8j1PLkQfcPwX7+7dWtt8EhG2Rc6Y
         hmH8KlBgTmlxQBQzxzuaHOXIi5ltT2oJtr7LU/MPTtImvFEhAf7wTmWfxH92yxeadh+n
         EZg14a9kCY4XoxZeQ/PXznuqmCNhns1ZvKhWrbzYPLCeCbCRnRV+FCtrB7kah0Z4qRak
         zC8ANhYJ+HnRXaz4oDouN7kOoJrdjNdBFJFzlaEueqE0mAZQpqfv7tvL2xSEkQA1CTCz
         U861yZxHtyKO00CGO1IKy2bSevQVuP8a/QihArYPfuW+OXPbTAIOWf0lT3wCmCXiKn5g
         eYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818929; x=1794423729;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9m7RVHJoTNX9vZUelgq/zfkDObxm0i0TSOz7tgsuBTc=;
        b=FTppzXhOA22TRf/p5fzCitMNuMO1tryqPu6PYDI4n6TQ9Im8Kyrt7wROtHMU6N0mS5
         /TjgAPfpaDlAMUlVhiIGN0mtCC4Rp+bcJjqjD0DFyr0XDGOooWuXksbknAA/2HkMAf93
         fI3yovxtUnxPJ2FVFjlqmqkEpd+dfHFJGE5qQT62kC4PX2u5fqhT6GJX3qci375ArZox
         WMcTrzzrH+I72o0BMkmyxn/2tPhWzzhgt4eQJa/PQ18OKdbXZnqO7coZjkEVr1OoOTXV
         xmf3RAxzbZevt6gbdBZOgVpLMsTb/yF7K9/DZfQTO77S90F2nn0dWh/xsFEsv34gU42J
         J1JQ==
X-Forwarded-Encrypted: i=1; AKwUvBzP+8TCTi/xgjDKKOO2QxYdS+6fS6yvwSC2LnNmKtBjxSN9/Fk2cnCXeswczGSgtqJA68CntrtXdx1fgeg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jCaw+yUln/ifnDWvsT6cK+xtCdJp9hnDaTSbQHe5rLSd3PZXg
	utfZ85gxr7fCJlG9DJO8kImTFOjOTIS+t0GYWvD+490pHVUDyyMmKBorKVJVR/HioEFcrHGOM3g
	2cWImieptT4SxzEbf/0EZgiwuU+zydnzvUrNf
X-Gm-Gg: AYBFou1vF+8Bp4hunqP+HDqLpaaU7WKDGK0V7vdiXh8f8fPY1TYUAqX8SEqt3xa9S+n
	pNoiHNEPdXe9ascdPsVttwlLNgXPKCK8oKJzrTsmgOFEmxbbFKvArhtsjKEUByCKN/5F+5ezHrl
	6iQJttIxcdT8OZbJzVZNeFpdg2ihP7/y5jg8SyKsDgQSMSZ6JoXOlEK5ikwN7QS6zLsc+RpUcUe
	d0oMU+z3Ypa5lZonLM1n13ZpvpomCJA9wxSzkgEi3EgfUqvzR0d0VurzW+mC1ZDOwOHolXoT7IA
	eTEDb/+bNy7WnPhfi4rcHQUZbn7Y/ENogo/pqWoPzhXbqeqtfjaPLYdM56dNrIvMD7LgywyIjph
	Kl6mrZEFZPQRAhSgyqH6ZX/V46zweEOusp/JcVzYJQF3CjcZdthFZ4kOrcQOUnsfpIPc=
X-Received: by 2002:a17:903:2f86:b0:2e9:5c55:c472 with SMTP id
 d9443c01a7336-2eb36469217mr154061545ad.42.1793818929400; Wed, 04 Nov 2026
 11:02:09 -0800 (PST)
Received: from 511566560828 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 11:02:08 -0800
Received: from 511566560828 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 11:02:08 -0800
From: Henrique Godoy <2dgodoy01227@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 4 Nov 2026 11:02:08 -0800
X-Gm-Features: AclHuK-NDBxEamBMdtik-7ORLe61ClxkfZSsfBGeZD2zKGsDfiKjHCul0scWrVQ
Message-ID: <CAL1HEBCsVKooMLqYUDc=cgNxzguUeTZa6ALqHrxe=kbC5xwYEw@mail.gmail.com>
Subject: [PATCH 1/3] tools/mm: keep the last record of a dump
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

read_block() returns -1 to the caller when it reaches the end of the file,
and main() reads that as "no more records".  A record followed by the end
of the file, instead of by an empty line, is read into the buffer and then
dropped: a dump of ten records without the final empty line loads nine,
and the tenth disappears without a word.

Return what was accumulated when the end of the file arrives in the middle
of a record.

Co-developed-by: Pierre <pierre@cloudwalk.io>
Signed-off-by: Pierre <pierre@cloudwalk.io>
Signed-off-by: Henrique Godoy <henrique.godoy@cloudwalk.io>
---
 tools/mm/page_owner_sort.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/mm/page_owner_sort.c b/tools/mm/page_owner_sort.c
index 6c2ac5d..4c2a4e4 100644
--- a/tools/mm/page_owner_sort.c
+++ b/tools/mm/page_owner_sort.c
@@ -134,7 +134,13 @@ int read_block(char *buf, char *ext_buf, int
buf_size, FILE *fin)
 		curr += strlen(curr);
 	}

-	return -1; /* EOF or no space left in buf. */
+	if (feof(fin)) {
+		if (curr > buf)
+			return curr - buf; /* record without the trailing empty line */
+		return -1;
+	}
+
+	return -1; /* no space left in buf. */
 }

 static int compare_txt(const void *p1, const void *p2)
-- 
2.39.5
