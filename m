Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793818931;
	b=XkCGuXDPHBBmJ76x8KKdQQzUItmWe8Q6t1sIftbsPkZTxEFSW6ItJVQULO0Jp8V3pmR3
	 pwXBHMX8s5BSPJk8V+40x/sbe6wxqzIXe9/22EfavCex66dYbC9uG6tZHCYnNe0gWXhly
	 DY4DEPRSDef56esEupWXCo/fOF3J76snSB9KzReGT6ZPNOGiQcpEBiyII3W6lMzpHwB4A
	 m21x3dHGKgpu53QciCwd15VcCpKYvT4nsvNJpw5ZSYUegXFatGBtqdu8y3soWQ5E+8iRU
	 fAMq9ptf3hBcVz8EPGyB24ym0copTfERm/6pAYYGoareI+dPcPt0CFyI0hjesXGWGLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=4EYm736r+cZjS/uMo0fJRYSotCwLKibNfByv7v/nf/0=;
	b=iC/NIJHqlC+TYBd+lzzk50bgynKHgy+vB9Mo9l7GXrENy0W4tMsXV/nL3jvf8LGodhAS
	 S1q1ocereR0JDZ6HEMX/4BiOLTOuS6XleP6ifmN0DgEiIjoLwjv+mW6t0si4Zyk6BgIhX
	 +1qOZULcewQ8l28bPPqxNCnxUpocXTy+Skqgl+4RGh32LuBSlFTobHYSxX0bZPkMdYFJF
	 RqnL/qEYFI5CvWUqrhHm70/6iqodxvuynPoYG6GbeHzoYJL03a9iz9iA8pyfLJ23LmuRV
	 4Atdv6Eukese9xWzinXT2fZ2Xiq0xIOkEPm2WBj2ol/PJsHT1/KdPX5QIuSxePQNQ6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZqJo0quZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A66606A337
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70A66606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZqJo0quZ
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso650959a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:02:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793818931; cv=none;
        d=google.com; s=arc-20260327;
        b=J+J7arYfwQyU6a6QP2bCkzO0qwjwNeH2huQMMlc7BMwVbX4JagleREsdRrVRXOh0D7
         4CnmJfs7ohpw5r0Y8zHpSL3E9Z665DrOXUTaYN8r9MjVG3pbNgYKzAa3YuWB4BN+6kF0
         LAAtgNSo79N1vYtGqb/usNJ17XgQdtBJOq1SYg/pCm3foMBWNIL49cyete2GgV3Gham1
         n1QR+okRfbL1idWw3rOcl/SzpBvT6XeQrmjCYw7e5KowlwNr3vQhfqbyiurmNtCxTGoJ
         w3I23kClGIoCocpUTXARb0HBH1WQgoDMt+DnpsfbI3dVCWoAVUxO1kdjYuP+cP30Alyr
         tPnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=4EYm736r+cZjS/uMo0fJRYSotCwLKibNfByv7v/nf/0=;
        fh=cEHCML96jWGSmYY7ZCJhQlNhla7r7MMGQUaI5v1+ghE=;
        b=RCZmDGkoEAHm3+JLjMWDmrl1H68bQP6Qa0Zna1CC2AKVR9YbuNciHndz/v1sLdXHU1
         ns0mKOifD0+uiU4KPc4Rp2u3oKo0vj6nmusE8rKpnYG7ddgsSRGWqdW6vS0Ehn7Ynp1u
         bcnjnPnCOnqWseAzEolsGmVl4buNIEuxDSdKl9ApI1wCl5/guNLNpZERTm5wOT3PZOY0
         YS1cNulO/DLXWogtH6KuL8e22ixGoxcOT5GokdZdpvycWwL5QzMo+WH55idCSc2W5NKL
         Z8zmzio/4WD57clseHcKKzoegpssor8KZ9oX5G0I7JxSuhDBzSAUtAxkwQGqtZVRTiQe
         /RNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818931; x=1794423731; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4EYm736r+cZjS/uMo0fJRYSotCwLKibNfByv7v/nf/0=;
        b=ZqJo0quZZrscXUDxJ3J3D+/K1duy0vpXR+a3AQYEHyEX3WzIIVPk17jc/lc82wOSQ+
         MuvDLZ20FMYTcvzuueA/6fVYKGS6JZ4fgOymGo92BUPV7B7usxNLXYLjVGetfBi+CL1o
         BfBWUHMmDhw0BW2CR2D3aaB5JTpT/ofuoiPBgOsioL3S9mJvowSsieozzPYtUyJWn4tP
         0RYQ2uoPn01nA2BiHYVrua+W2iDcQYdtlqR0aD0JgrGaCwU8nK5cxzEfEml3B9H1KPoG
         qODKc4yFu3l2nwpeBazePeSyoJo1KoVMh63bR0rqWyKvViS4F561ECiwiGc8P8pH798N
         blMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818931; x=1794423731;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4EYm736r+cZjS/uMo0fJRYSotCwLKibNfByv7v/nf/0=;
        b=LsuHbfdjGtT8ID+i6+fIDTbrZvtLaWB7uFYVJpyXXOkMqeilj4kfImOVisFtDPCRWL
         wlUKy4/Pn2F/XvWywbuDHfZa/aG45mPrFSjRfXue0NAgM1cf07NGSR84yuykb+VMxFpV
         +tOVojD9kaxSR1qFnmuxsHs0sAFUYQUSu4I/haw7cKz91cVv5jiJB/BiOxq/AimKa5y7
         A0XthiDN/XjYmnr+nRWbBQv3uobfLVB/p5tDhM1bWtoEo/uOWsFqbnSr2EqZ6fD/Mlvf
         r8ucwbhia+yghLAKmSW7RZwR0hxYl6KGyEseUkM4jatg2Uq7q+WGabN+WWLYiBhlKrUS
         TT7w==
X-Forwarded-Encrypted: i=1; AKwUvBxyldStWDrTZaTRCLCV4k9D+5mrOMrAQT5lkk50mhwA6iDZU2oLYAA3q66L6tTpis1JLT1qcOWiDRl6CFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PZlsy17uFRyBFGOM9IJs5UvcMBHQkGI4gN43kpNBeIX0UXpJR
	243qVhsu8a8osQ+SAcv2pwl4y5tT7ObCUxqa9QKO8pKkVt2BDxzZL7bnhScmZDqQWsyJj220CiR
	9qaTKamEtG0uGhfTCnwTqENEFNsLieE4=
X-Gm-Gg: AYBFou2qvU0FfMCB05LNyn4iKxpbFFm7YsUdjWeeKVPHt1eYDt/QzQyCswR9oo88sVQ
	muEstegVhlY3XcXQ9OORF21xPNfL7Wk7AGFQoNUPAAXobmHs5PX1B7Z9dvCiQwIagg7IsUWVJqp
	maYmguW6U9ZXkmhuysNksOLRZmQv4IVlhKIB48kPOfWxmcPK9yVnDtFSz7I1IKlfD2Mmhq7S4Bk
	6CbPdUNk7bwRdaDSCV+tRUiw4cbwvoikw8a7FSsAR6hHvTp2cJQ+nuA22xK5rjEbh1CwCX9lbYK
	ry5ruOYZ1gTFlsHnaziGw1jstGoin9qNhReddeH7JZWWwcnflpgHrx5Y0V6/91bsg6t80J6rt09
	Vm4Bwqgo4cEb3V1VJx2wCPpLjoDrglbOK4OOvXeRd3ipjRSY+MQjSwuR5PyBelATJ04s=
X-Received: by 2002:a17:90a:d887:b0:3a8:6045:5a19 with SMTP id
 98e67ed59e1d1-3ae89777139mr15621477a91.37.1793818930670; Wed, 04 Nov 2026
 11:02:10 -0800 (PST)
Received: from 511566560828 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 11:02:09 -0800
Received: from 511566560828 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 11:02:09 -0800
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
Date: Wed, 4 Nov 2026 11:02:09 -0800
X-Gm-Features: AclHuK9dvjndj19qJaKgS5zpxYZrJsHXRwZ30MwEI0RDNBGZUI0hkPo86QxSkJw
Message-ID: <CAL1HEBCp9VnGJRiuJ2xkFk7jgjeJpaicS8ZkxR=577U7hKt58Q@mail.gmail.com>
Subject: [PATCH 2/3] tools/mm: do not mistake a full buffer for the end of the file
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

read_block() returns -1 both at the end of the file and when a single
record does not fit in BUF_SIZE.  main() reads the second case as "no more
records", so a dump carrying a long record is sorted as if the file ended
there and the result is empty:

  $ ./page_owner_sort dump.txt out.txt
  loaded 0

Tell the two cases apart and report the record that does not fit, with the
name of the file, instead of silently returning an empty result.

Co-developed-by: Pierre <pierre@cloudwalk.io>
Signed-off-by: Pierre <pierre@cloudwalk.io>
Signed-off-by: Henrique Godoy <henrique.godoy@cloudwalk.io>
---
 tools/mm/page_owner_sort.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/mm/page_owner_sort.c b/tools/mm/page_owner_sort.c
index 4c2a4e4..a042bf1 100644
--- a/tools/mm/page_owner_sort.c
+++ b/tools/mm/page_owner_sort.c
@@ -140,7 +140,7 @@ int read_block(char *buf, char *ext_buf, int
buf_size, FILE *fin)
 		return -1;
 	}

-	return -1; /* no space left in buf. */
+	return -2; /* no space left in buf */
 }

 static int compare_txt(const void *p1, const void *p2)
@@ -794,7 +794,7 @@ int main(int argc, char **argv)
 {
 	FILE *fin, *fout;
 	char *buf, *ext_buf;
-	int i, count, compare_flag;
+	int i, count, compare_flag, ret = 0;
 	struct stat st;
 	int opt;
 	struct option longopts[] = {
@@ -965,6 +965,12 @@ int main(int argc, char **argv)
 	for ( ; ; ) {
 		int buf_len = read_block(buf, ext_buf, BUF_SIZE, fin);

+		if (buf_len < -1) {
+			fprintf(stderr, "record longer than %d bytes in %s\n",
+				BUF_SIZE, argv[optind]);
+			ret = 1;
+			goto out_free;
+		}
 		if (buf_len < 0)
 			break;
 		if (!add_list(buf, buf_len, ext_buf))
@@ -1050,5 +1056,5 @@ out_pid:
 out_order:
 	regfree(&order_pattern);

-	return 0;
+	return ret;
 }
-- 
2.39.5
