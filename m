Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793818932;
	b=VN7PEnT709o0fqmcvA4ZfcK9LQkPeCGA5DJmLJrENc8fRN44xFxYGJeufzoJImuCg6sK
	 Mvhe7T6vIOoRDuCnR/XYJaGm4k/2jfYOSyIej39CxJSXbRaxmYkMWk6g/7frL7pZ6h6lG
	 4WRWQC0iwuAOIKVUgFeB225cb4nG8PiIFMqRGa1PcJyoohih1DlVYAQ1z1zsEK4Eif3Fo
	 L1P3YkPwACRIAZz8RNyrMMrM8KLvy1ZecGLaZ9k+9PinqJCMVzBrC10+cxiMm7iNwkcFP
	 gOYYvTIlW7NLbTkzpSTij4mNGvei94K6WFhSYdg18huQc+hJ1A1A+axgok3cfd0xzxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=jgTZFnwXdV4AJUne0nV03xTEkp3bQhCd9JPNdkYZauc=;
	b=E0VPgYZlc7E01Cv6lnN/ke47+phQDTk++uDipIXVLGvi7M7Uk4v5pvRW0+AJR4Cl4u1r
	 fwvED+amGRMfLqVlIgGCB/km3SvQrcZciJkSVAN+gmi7CErgxC0f5rBv+1khnZKZpD8fU
	 +p4PoRwhee5sE6yCzSK62mYPjzDrLraDnIhcHvgYoPHqFV+jafklTgI5KR/VR/ya/dO8v
	 rbcaeALGN22k5+hqNixSllJKCbogP24DborVjOHaF0wTOgARobRkCbJfeyVvGjbrnqbvj
	 aVsKdJuq0f9YTWjhx0SFue/pfaTMTjM4FPeSA43LGF1t7GB74C11LT1kRO7TTbu1Epg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpWxhSjZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAC5606D814
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FAC5606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpWxhSjZ
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso6562845ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:02:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793818931; cv=none;
        d=google.com; s=arc-20260327;
        b=kdNeplaxp2S/IFs/q9C6tw68liLHIdO/tot15Am6yj8vG0ty8Zy6WTzAYJ4fsr7iLz
         L3lbVZ7a/EwjoFePrHSDLkc6NTeA43lkILHzKwR2q7Wmu+TxSJYaSrHleakZ19MWrWu2
         dPi2FLqBsiMHwu4bpeQ4WF/Z53BOTo0ozu2TBQTvREKaVusowaaxUfdsXD2aGB0+kJZ3
         1rrLAB/FqUFleq88o2X3gFVTnz0LcVFoG87KvAjQ38piPV10fKKFd83IvEAmgcaR7iua
         woTsD8eEi6Fr1QTp1+MwNywOJ2BrH+XiRt+Qyno4S5X9zBTscpx8v1t1U9Daif7jLuFe
         tw2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=jgTZFnwXdV4AJUne0nV03xTEkp3bQhCd9JPNdkYZauc=;
        fh=7AG3RsGSpukTzC6EFDqor+14sEtWC5ZH8DsIuWMsJoU=;
        b=RZ/6K1BDxfqEgWdcY1MY7Fqsx7ojvMBLWXbzgqWX3CJK15Dx0ezFns2zTaZPqZ88AN
         asLKPGy4MRJKZoFhKe+EU6Uus3auUgCMVMGau2QyLLAWFlOntXdnGwwCrMTLeSyRbLm1
         v7h1oDd4sIGkAY75sz++auShd4bkvHEdbedJ59bug7kFSIOTSdXa/aPyFPxydMiBpQEV
         fbNaUqBreNy3iNT2hacjs2GqK9OqonOOw86Vem3JNGGl3r4b2e2HNCnOCn0K85+Fa13x
         RP4JTI22ugMZiEdCi6SEANYTWEcMaCQnk5h/TL/G4C36rvYfkaxJadjSzwo1NGXCO7ut
         FVlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818931; x=1794423731; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgTZFnwXdV4AJUne0nV03xTEkp3bQhCd9JPNdkYZauc=;
        b=RpWxhSjZXzny0jjeyIWw5RBECZYYwRFlVAUTRGWp8NNMNVKlOQdkWDV6KEVb54jGKh
         pVWLy+/457gQkGE1m2CkdbSdOChGggxTlGl76r3coUFNTanZt6/7/3Iv7YiOQHnPZNn0
         tvrXsnEZNQ0BgOTtUnqBGh8vje0LIAauW0XDpISibOM3Cn6VEvBQ2RvB6mU0v96yFPfA
         iOl9fWP7S3TRyudmGJhzSdssEiM0Pr50ciDzROD1yQ5f8x91Y+WdBqjFBxDph8hDULM6
         6Uy7f1hd1ZKMvcKbGm4qkkU4ViBaqRgOZx70ogenjUGQqXLYZrfDkL0Gfexyxu8ph+Fo
         xjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818931; x=1794423731;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jgTZFnwXdV4AJUne0nV03xTEkp3bQhCd9JPNdkYZauc=;
        b=eFByRK57FtZul+BxfMKzmViijKYO9XaWptxkUQLTL7lhzbk8jIOQhoQuvZLaGKAVs+
         yBUJQCYUpvbD4XbDsUI2cgITI1En/ac+Gs6gZna1a7WllPzEV/9ANZadjugeYTL+AxW6
         /+YMsoKi54jn3i9TXzAO8BdxW+h8j7pYdi5MeMuAAzplkTLw4NmqBy2/QA+YzE+RTprb
         mOM7lrFcYl4dgR+0dmvs2HfKzOo7sEA/uJMOIaH0aELrfWxPPQchRB/uoZncWjVpHjXA
         ZClOSU0Ag/CaiJGmOUK5FI4KaGrM5DzqI/YPLK01HdpI+tAuiD1szBwOEW6xu6/UDeBJ
         7S3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxmN5Cb/TYv5npKTrXze8uZQukJB+VoUbjUqE8gB+qmANORbpnXX95z+JTvGmDwmhK17YSmmivXU/lakNI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q7xwG+cZyFF+Qi8B2Z82yjHofcE8VL6Xz1RoDSqa1SOLFyyHc
	F4r57dw22lftOVagpp+AQJ2rDlfDFbxEAbjSLn3Ek2jG1NwWLnCEePXCvCZfXB5U6ekA2AlwJ3o
	v6egg50xObuoic0bwg296HNcsSsyRQaA=
X-Gm-Gg: AYBFou1fczjx5PWcnEyiMHqHW6dPgmFEy4zMEz0KVKh8dEQcRB0JII8r64bOR1YTP7D
	17JgiSoqM9Xg41iajqMR5T1L5FPKbKiKWrYJ4wgkjzV16zDy2B6wpUMm2Aj7ZAHC0r498liC18G
	whbZIZXLQObTJHQExCcLwiUBCASish39LLfZuYGsKjyvl8+YLYq0bt46h0PMuGuJ7fFm8eZaffy
	ABb8dZiknf0EPZ5bJ4YHnsdHS5vnoGxdS4Ue0MPM1EZ/iInP/63idXogpkqV3LQMrafKWpL1BOB
	pxw5W3XuSiKLN8P/rLII2t1RuxTrdJ8fAfE3KYvHyGuKioz8NPkhGZvJgrp7vGGg+sA7y766Yb9
	onXgCFNJtkbQJ9DPPLBx7ualX9jrmAUC+sw2kxhRv/stm80jZAOTKBchiqLWBu+AKA8mMQnxdck
	2mdzUsVRI6IDNb
X-Received: by 2002:a17:902:ec85:b0:2e8:965c:aedf with SMTP id
 d9443c01a7336-2eb364c5da0mr169489445ad.42.1793818931383; Wed, 04 Nov 2026
 11:02:11 -0800 (PST)
Received: from 511566560828 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 19:02:10 +0000
Received: from 511566560828 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 19:02:10 +0000
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
Date: Wed, 4 Nov 2026 19:02:10 +0000
X-Gm-Features: AclHuK_dgHL72DQqlZJrR3IOIV4yjCUzHEWofjNRaIHKPE1uV2bQfEqfrreiTvI
Message-ID: <CAL1HEBBjmor-B9E9KjpSCh=TW_wi1AcKEwBaD69_m2UkeGWbMw@mail.gmail.com>
Subject: [PATCH 3/3] tools/mm: grow the record list instead of guessing its size
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

main() sizes the array of records with st.st_size / 100, and add_list()
refuses to go past it with "max_size too small??".  A dump whose records
are shorter than 100 bytes holds more records than that, so a valid input
is rejected and no output is written:

  $ ./page_owner_sort dump.txt out.txt
  max_size too small??

Keep the guess as a starting point and grow the array with realloc().

Co-developed-by: Pierre <pierre@cloudwalk.io>
Signed-off-by: Pierre <pierre@cloudwalk.io>
Signed-off-by: Henrique Godoy <henrique.godoy@cloudwalk.io>
---
 tools/mm/page_owner_sort.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tools/mm/page_owner_sort.c b/tools/mm/page_owner_sort.c
index a042bf1..5b51cff 100644
--- a/tools/mm/page_owner_sort.c
+++ b/tools/mm/page_owner_sort.c
@@ -571,8 +571,16 @@ static bool add_list(char *buf, int len, char *ext_buf)
 	enum FILTER_RESULT filter_result;

 	if (list_size == max_size) {
-		fprintf(stderr, "max_size too small??\n");
-		return false;
+		struct block_list *grown;
+		int new_size = max_size ? max_size * 2 : 64;
+
+		grown = realloc(list, new_size * sizeof(*list));
+		if (!grown) {
+			fprintf(stderr, "Out of memory\n");
+			return false;
+		}
+		list = grown;
+		max_size = new_size;
 	}
 	filter_result = filter_record(buf);
 	if (filter_result == FILTER_ERROR) {
@@ -952,7 +960,8 @@ int main(int argc, char **argv)
 		goto out_module;

 	fstat(fileno(fin), &st);
-	max_size = st.st_size / 100; /* hack ... */
+	/* the guess is only a starting point, add_list() grows the list */
+	max_size = st.st_size / 100 ?: 1;

 	list = malloc(max_size * sizeof(*list));
 	buf = malloc(BUF_SIZE);
-- 
2.39.5
