Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356007;
	b=s4P9b74ChJ79WpGP2lJ3DbXfrnoGX3nNNO0fMdq2gUije7+dQjROt3QHRDyrVeovWFwE
	 n07VoLI/nWrdOjUL87zuOjyMqoHzjz+1V3eAuI1PNO0pEC4jOx4pm1Mscx6wxg5bTYH79
	 zeaMTyptI9wLS0SPqA5r6kdaO2cHeqYRacQJwKfYn8mB3pNfoBxEzsU46GTntnP2x/9EK
	 runfAQyjEn4ZADh2LpJCYzovQ96Hkh3e0iI2u1Wzg9NUaBFqpPMSvikV7z5iJvrWnkho6
	 AlyPuC0uA2sPlPnEioas6DVs5mP8RAvIadghia5i7Q6fLdaE8t5qhqWcb3LrnDBsTRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details:X-Proofpoint-Reinject:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=59Ozb7vPHHK8a62sFDWgZOfWdnPHAJYeNCW/LcPyMCk=;
	b=yGMVAU+hwJUel8w92ljajNUNdz7/hjIAnrEOBtj0z8BZ88YJ9kNdw+iv/opkW+DuRj9C
	 PCVwO1OJZOof1DSGbIBAqhdqpU08BDJdhBsHM1NiqNGYdbmDXhOqTxiiLJVFUuemom9is
	 WdkV8Bc3t5yXClh9y9Uf1zbKbtWGLrR4gD+LZUVCQ8FJE3MNG3SRhcYJlvx8v8I3jpzVe
	 a1oIxRav1CRl5+wB6q12TabcRjooosHHfrygEUjqXdiyIAj5suR5hTIsP7E+nFg1MavTl
	 ILMx0bGnnmJu52/jTJdN+TBJGsEvWNaMw8nMj3S9y9BL9/FzUvFr2ILZ+q9/VClK8Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=nhc+FC4v;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=fg1w8IDQ;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723AF606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 723AF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=nhc+FC4v;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=fg1w8IDQ
Received: from pps.filterd (m0167067.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UALMw9916835
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=59Ozb7vPHHK8a62sFDWgZOfWdn
	PHAJYeNCW/LcPyMCk=; b=nhc+FC4vA/6tt68a/uzpF45cTcNXjM9fomuaWnrk24
	GABlqMOB9FLLM0zL5xBDE+JeCUGsR4Q45Fh+p9fwzb8tvmKPZSH2gHwxqVrUfiHB
	mB3q668KCodAp2WUS/FTAsEvwy1iiQpiW3Ud0EcPvjYzvT6k/sr55xc1pRoNVVZy
	4K532A7jwMz1QmmStaCC3S7eleunbLZy5Z+rEu/HF7AsxJQv1W7lALu/o/yWO3Sm
	U+ah4zasDjPtVlc9eHERw190gxz9xQBQMcgZzrI69th0Usr1Zfep0z58g4R3PwlI
	wM5TdxmR80vWQ43A3iNpAEi6VX3BxlsoBSjWCHXF7JlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hm7k00ftm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:51:45 -0400 (EDT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso499190785a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793285504; x=1793890304; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=59Ozb7vPHHK8a62sFDWgZOfWdnPHAJYeNCW/LcPyMCk=;
        b=fg1w8IDQ9+SJUbO83Mg7uf4Qt6w2CMkC+YvBcfdjroqkcUsWkeNGhn147q/okC4yiC
         oWZiPAO2E/q8H/k1aEkCegh2KEU8z3tMUGln1yV+O5Aj8HlEZCB91ln+MCb84R+IlANU
         b1yCc4Z0sJ1abN8i77hqcHAhZEB9Hw40eWRoAdD7I/HcIjzxQbMTjz6iMcF7gWeA+wQL
         SfUjQqE5qfBW4L1EPsaGd4RY1+9di4hGM/nbg/AyBHEOijTlUTv7P/f2lYZwTHMHRQ2Q
         cII1Rv04z5DsB6vAQ9ZjQRy2l/x83ljUs41MXbm9ab6iB5RZ0XxMDKqqSihwBfrBDKfB
         /PYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285504; x=1793890304;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=59Ozb7vPHHK8a62sFDWgZOfWdnPHAJYeNCW/LcPyMCk=;
        b=sUFBnHzPFHxUNBALHkLDOPXdO43DMSqeW85lzKyq0zMC8yx0ZCDzGrT2w39RsPcrDd
         VbwtxbgaEFpGGfpcO7l0ZVbv6ZdSgoecL5YJXh3cl/beJhfFzxj3LYH1sGn4pLKoNJWI
         zfAiIjiplLcS0bKfFJMiRoidZYwBlEQKskt+xWJ9zP2oAoD9Ao9eeKqcBT3xygv4vTti
         RGHF5EST6rlNfoZ99mDq8adAHWhWVgpKhfbnyZaJYrhP8KANn43Q+ZeqN/YE3mIVJ67S
         TWmeFthG1LtdOOxKJ0UvFQWlIB9lbZ5M/p+mEk6eJHX8Lu2r4zD3XkBTBsFnjQRHiHPC
         Dyig==
X-Forwarded-Encrypted: i=1; AKwUvBxqAJipr1S98Iwqn/dAlyOAp3rz3M23EF9nqHLBYa0+R4JlnZMgmQF/8FElTFaC8xUYkIbRiucmcfYmJ8w=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7lm+6zVfYkbwLypLGu+LlKu5bqZ4v0QMF7LtZEfUtlYF2/Oyi
	/2IhRCLsX3PHl4ux1nIlOXeOfZbAYiWaMNyk0CwTg3nL4uN32XSt/KVn0uH0OH6W/IqlBvEWaP9
	iVzRAwhxFx+VX5t3tQ3l0sDEIvwT6vho9nq1H89tGH+xZ0MCREDxi7YwHpJA932ow3+JRYgqQ
X-Gm-Gg: AYBFou13xYca9BvJRgfFmkT8qzNs9HqRL4z7yjoL5vyFPKQl0MtKVmrRmKI/+p5w646
	UMkh9oLLfoGvfipm0Wq05j6XlBKGTAF4rZWYbA+JYiOjcJUUHmG3eB66P9x29Hb1VllgpXLV754
	N0Ev5CF+9DkPPxsTRR7uqXlltPyMP8LvtXcqztp3mzxnAQbYffzvEGo1gmQIEZB4916aJf0oVRW
	79DfuLilESZT06xT2d8fg6d2mGW30HGmHi+K6YjoFbjl1eMQ4gJP7uc0BCvQrPk8YWn5crPX/zF
	2/Vxb8dgcr3WEhzwarBSbuR79dQ3CD6oNngC7h+eGCnjiaF6s5vEmW2KnQvj8VpjY3cKyCETUR9
	PK+EKX2MHqqCcsKkByutj76HmoiXyorKkrtA37DZX0bSU75MAWRAxBTuyb0ASCWvpTJBMeUp9Js
	hshqZtUI5XtmssEIA=
X-Received: by 2002:a05:620a:4107:b0:93e:f0b9:505a with SMTP id af79cd13be357-94408ceb986mr911546885a.58.1793285504520;
        Thu, 29 Oct 2026 07:51:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4107:b0:93e:f0b9:505a with SMTP id af79cd13be357-94408ceb986mr911542785a.58.1793285504013;
        Thu, 29 Oct 2026 07:51:44 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04723sm78153515e9.5.2026.10.29.07.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:51:43 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v2 0/9] ecryptfs: remove the remaining struct page usage
Date: Thu, 29 Oct 2026 10:51:21 -0400
Message-Id: <20261029-ecryptfs-folio-v2-0-dc53f1d47d9c@columbia.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGld42oC/3WNQQ6CMBBFr0JmbU2nECCuvIdhAcNUxiAlLTQSw
 t0FXLt8yfvvrxDYCwe4JSt4jhLEDTuYSwLU1cOTlbQ7g9EmR42ZYvLLONmgrOvFqbzgUhMxFTa
 FfTR6tvI5g4/qx2FuXkzTUTmMTsLk/HI+Rjy8v/GISiubZWiwLBps0zu5fn43Ul+5naHatu0LL
 gdYgsEAAAA=
X-Change-ID: 20261014-ecryptfs-folio-67e80ccec7f3
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793285500; l=2528;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=MHQHbr1BCeZw176BeIq+ezbLBqffStXmrVqOaMJ/nQQ=;
 b=APpNhk/GxBuPNTA1HtPJwEIP5w1L3UgpougRu8JilBee/ZtfG3Q/Dj7aPnByh50bWA4aRaP+K
 lDThVxwrrvIB656mxpXMe5TqSGeoZLqDZa7kmu+umjOJ9g6i/Fk6Fgw
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11949
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=10 impostorscore=10
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290058
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: h2pwrWchQrXrHgGtXWljetabXLpzRPzK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfX2vkDZTWhEHaR
 Hf6xEi97L7OUjrlhMh0GWrEuQRLYzEYz2tIsPV+xyBY6yRpUbZjyDlViKre3UrcM2nOood6Kx37
 MTuGEFyzHftGVJ3ybClNdKXkhR8KtWcS1gq0wT5ykMF09MQIRDIMZ5m+6O6j14P+Japr5SdnezY
 BkuaDiVJiv5QUiyTzLdWOGjCGbhbv/0InkE5QMyifANPyXEkTiSVQj2+h6ezatwCK+92ntJXuD2
 OglRAMPM5nnRAaCV2QBjqlPzvyJ5WINI/WHpv8AlQa/D5/1VX+ho0uofXmh5/dRIygTVv0Kk//V
 QT3rQ29Gk45uX2BheOBxLTEcsGWHmfS2eluKQ9aa9ttlfJtihzh/PPufx97ytKdQRoho+FgJg+8
 MKtBOQdt8VCEfIZ83MMDupnUN3fIy1CWBsDLCGwOMt81TcuMEZRLI3+sYto0KmoNBmynhNH8NSa
 zA2KWYcU79KWuVYaVbg==
X-Proofpoint-ORIG-GUID: 2g_5KQ0eyFr7iW0xLHUVE33ZkuV2yjim
X-Authority-Analysis: v=2.4 cv=BKEmP1QG c=1 sm=1 tr=0 ts=6ae470e5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=5seVXgKEpYMQFUWKuG8B:22
 a=bC-a23v3AAAA:8 a=yHkjf8DjpYn1_ea-2f8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfX52euUNGeJlQn
 RCiGYRziKdEp6UCB/KAj3ui1sT5FvzVeXrTIzy4DcaCEZFkiceee5LzIyLI8L5fQF2VYhQYDQD2
 +Lp0hEU/ZCWRCQbtYBEpyPIg2P8lqPDdzc4UiNOgw7SyoTsRWM18
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11950
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=10 suspectscore=0
 bulkscore=10 adultscore=0 phishscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=2 engine=8.22.0-2610190000
 definitions=main-2610300041

Convert the page cache side of the encryption path to folios, and use
plain kernel memory for the buffers that were only pages because of the
old interfaces: the ciphertext block, the header buffer from
ecryptfs_get_zeroed_pages(), and the scatterlists built by
virt_to_scatterlist(). Also make a shrinking truncate zero the tail of
the last folio in place, as other filesystems do, instead of copying
from the zero page through the write path. After this, fs/ecryptfs has
no struct page usage left.

Two related fixes are included: the packet parsers now reject a
zero-length encrypted session key, which used to leave a file set up
with an all-zero key, and ecryptfs_write() keeps the folio locked until
it has been written to the lower file.

Ran cleanly with fsx and fsstress on ecryptfs over ext4 in the default,
xattr, and passthrough mount options.

---
Changes in v2:
- Patch 1 (new): Reject zero-length encrypted session keys in the
  tag 1 and tag 3 packet parsers, per Sashiko.
- Patch 2 (new): Keep the folio locked in ecryptfs_write() until it
  has been written to the lower file, per Sashiko.
- Patch 7: Hold the folio lock while encrypting the zeroed tail and
  mark the folio not uptodate if that fails, per Sashiko.
- Link to v1: https://patch.msgid.link/20261014-ecryptfs-folio-v1-0-f4412187b1d3@columbia.edu

---
Tal Zussman (9):
      ecryptfs: reject zero-length encrypted session keys
      ecryptfs: keep the folio locked while ecryptfs_write() writes it out
      ecryptfs: remove struct ecryptfs_page_crypt_context
      ecryptfs: use a folio and a buffer in crypt_extent()
      ecryptfs: use kzalloc() for the header buffer
      ecryptfs: use sg_init_one() instead of virt_to_scatterlist()
      ecryptfs: zero the tail of the last folio in place on truncate
      ecryptfs: rename functions to refer to folios
      ecryptfs: refer to folios in comments and printk strings

 fs/ecryptfs/crypto.c          | 145 ++++++++++++------------------------------
 fs/ecryptfs/ecryptfs_kernel.h |  21 ++----
 fs/ecryptfs/inode.c           |  51 +++++++++++----
 fs/ecryptfs/keystore.c        | 118 ++++++++--------------------------
 fs/ecryptfs/mmap.c            |  60 +++++++++--------
 fs/ecryptfs/read_write.c      |  52 +++++++--------
 6 files changed, 164 insertions(+), 283 deletions(-)
---
base-commit: 8f6626bd6594a78f454d02b27b74a580c890cab9
change-id: 20261014-ecryptfs-folio-67e80ccec7f3

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

