Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898619;
	b=vakBZudduJ3PBdlYY2R0knc2QA7d7NW8i0PkAOgLzgEYPlmN6JGG7uqJ0G6EAaK10qiu
	 E+WPWpur1Vm8nYrO0DXmvPMI+mgQVfJVk3QziaYdETLqLkraPjkxbew+afT9XDuhUwYg2
	 a3sTGbeNbADjRTVUp/aVgLPOjRAv15ia15yoMaTiNdIrJhiicFV9eFh0BnzNhR3FRusC0
	 IhCfTf0zgFVbtfVqNDCAgHpz4U6h4tVrOyeP24OCba3/g/GDs+xsoVkzZ3lqtiYEGVNgd
	 8ZrtFth4sWJtnZesaK45rOR2ifRjOVQ1zksiRbrmuQNQ3em5ofo8VBkr9Ou9WCsXkNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898619;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MxlXtuPkL8RQH+hFLhbCnsx81YWf6UCxjrfTDrFMRq4=;
	b=KJ1oc1qwPNNU00lkiQNSczyB6GlvtvPgpFj13uI5CKqC9583M/lcYt9xnOptSrxcMdA/
	 bb60L1aYYMF3mwxWi4Gza/GIKLMLN1612MEfua5CRCWVPcewPuVupx4GVG9pvHVJ6XmU4
	 BNvt9idkvI0QcOqacocB0v8cdk4JiVK9PthKEKILXs5vmTqhbYmR1210lcFC+XIcRo7Pe
	 aHNwEA9UTOdo9U9kqWCqL4hqvki1QSwvcFdGP5+hxkWkdBW+2YW4oAxCSGt5fJTio3ss4
	 hrviJ5hoU8fQu2PrzRQaV89G5K7FhVItbg1TLDEyEib55UlaSOrnAQ6jpE0kXhUWk7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Sa7UR5SE;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=Z8A89xc4;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D59606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0D59606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Sa7UR5SE;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=Z8A89xc4
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH5ZZQ63371185
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:56:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=MxlXtuPkL8RQH+hFLhbCnsx81Y
	Wf6UCxjrfTDrFMRq4=; b=Sa7UR5SEYMwMwb6w3L0AsO/CsstWnE204cy2oL6RRD
	ialPIj9wPoISZ5QPobYAMMA7voEwtSOZP+nNOQWV3ryiGQsq0HuOZ3BOvJzS5BwI
	Fbs19pgpy9yxjmETeguhdg0us1hirn2VDgbhnkDOjWawruWlP9pL+96F0//1eK8l
	XlZtg6DewfqQctS/MVfRWjDArkRHNk6LOkoeQtaTUoWecuywy9Gkv8w6+IPcC51W
	z5oaFRuwJcnpNXdOtBgvkwXM6rc4n5WwB2BbcLbjqKCAdJGoaVVCjJWOXI15V7qf
	Buks4csiLQxTQaUKhP/KCXwimGKL3ZQ0plnpCTFJ8gkw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j0b959pbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:56:57 -0500 (EST)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-537548d4bc0so109852271cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794898617; x=1795503417; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MxlXtuPkL8RQH+hFLhbCnsx81YWf6UCxjrfTDrFMRq4=;
        b=Z8A89xc4BufsMdtdae1fsTm2DYqGO7+G8yn/e5nUPfpg4UDQnuypczFSD5Y3dDH4Ek
         kBFNkp0AtxFgMxXlqbRt8gBcV5Mjjfl/GxlCKmyXsvtFdjttmMDWvNya14CHGzNOeGRM
         d4wzWC8dGrEstxmtEmJLxhrtWSHgYhPQke46l7Ty9sEzgaNHZDI3zbYWXgMVYABx97My
         pzmdWdA4DO9upSLuyjhsm2cXtnHwivM5jrb0xvJyjEJVzIvC6+KaAqaomBYxo4l278U3
         KUvrdNvB+qEl2OVzvJljBR76idt5NvNKRNo6Tk1KaCVpp1f6//3HR9k3/6n03jO/kMD7
         0vlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794898617; x=1795503417;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MxlXtuPkL8RQH+hFLhbCnsx81YWf6UCxjrfTDrFMRq4=;
        b=R/t/yOriwk9czoOdBboKDwEDS+MCSnJB2aFp1HF+zQbvra/j+7Plc4eK6gnHgzEYSg
         CYZw0/RH2CzEebFtH3c+eJzkOsiscct4tZjDX8YZ76wg6mixKuTOAJRf07ZMLKYYoCP2
         zSQgdHyBitVVIJ8FZc67yrTZatgHHWXzQedvkd1XTiZDvvGVQvkW3joLdGL2BObgWGgn
         SU6gBzbmwi5109AlMF/crHU+dS2W05WeKSfrO8vEOXrr7j3Ai0z1v6lt3QpxHErdkfVN
         QrrqmemiylLQx4cq7d3DqhoOKdHkTYKKkiccYcLAM2p6lAL8s6YRK+x2Y/u6MVwnSiex
         WFaw==
X-Forwarded-Encrypted: i=1; AL+hErEep7TN1+H2pLSkOnX2bu1MD6dzJ7ewbDekVR+/ZZBbJoF3LOrCtyDhg/7DjBOiaXD09PDpOqOOMDohqZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z82WjXvIYO1jlGkCp//l/lOMhKk/vNi04RI/790gD8K/8+lZ9tb
	ftimKOj1Sgh2Cu88cO4WEQkeqCBlJCNJnJaYMZblmu1rGwX4WW9Dp7VovRLaCi9uRHCIbSR+Qxu
	YqNDBbJwcsgKqw6Kyx6sMCq9u6GYE9a+5s55ppAqmaMaT55RmJHbXFMzAZyuIfV3MPwteLA==
X-Gm-Gg: AYBFou3Swss2sr5FOpDdHxPR8UNSuE1/f4ujhshOOq2LpN9THHruR83TEby+32/mYG1
	m8bmBTsZKaIU6GlnCT2LwpvIlFWwE3U8EXP1B5OuEIfaHZsEtfTg5rr2djC+lvqkSbfyE+zOsBe
	BhQ3jMH1erVTzbAdUOGi+QrU4hOR7yfyhyn+Un3/yHqkWdyiWSH1U6dI7OEA4tNfxZDP1qJj8ml
	kkHuEz5HbX9L7cV1Yvggw3mSFtnXLFZGLLF+QkVpWGUB9XzW/SLxf5Ae5zukW3Ep7lbkXUpm71O
	GC8u6tdhHqLbqaHkyWr89PmBcF6smhy5+yLEZMXY1iZx1OURlx3kfq9wkymwe2WuOIw6WFQ1DzO
	DVk0lGO370SOOLioaZL7Y5FeIrvHNXK9Ca5bZE4U9Gqt9EpPXkYIZryF/58GTNMvHJGuQQnltUe
	pLG5ftSRaVAYSCkb1qcA==
X-Received: by 2002:a05:622a:5a19:b0:55d:3350:d266 with SMTP id d75a77b69052e-55d3350d46cmr103229171cf.26.1794898616474;
        Mon, 16 Nov 2026 22:56:56 -0800 (PST)
X-Received: by 2002:a05:622a:5a19:b0:55d:3350:d266 with SMTP id d75a77b69052e-55d3350d46cmr103226761cf.26.1794898607414;
        Mon, 16 Nov 2026 22:56:47 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0a2006csm98408871cf.10.2026.11.16.22.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:56:46 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/3] jfs: remove leftover struct page usage
Date: Tue, 17 Nov 2026 01:56:15 -0500
Message-Id: <20261117-jfs-page-leftovers-v1-0-2722918aacdb@columbia.edu>
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
X-B4-Tracking: v=1; b=H4sIAI/6+2oC/yXMwQ5FMBSE4VeRs9ZES7rwKjd3UTXliCA9iES8u
 2L5TTL/SYLIEKqzkyJ2Fp6nBJ1n5Hs3dVDcJpMpjNWFtmoIohaX9hFhnXdEUbryzpQtjLMNpeM
 SEfh4o7//Z9maAX59SnRdN22rkrd2AAAA
X-Change-ID: 20261016-jfs-page-leftovers-14ca23de2a6b
To: Dave Kleikamp <shaggy@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Christian Brauner <brauner@kernel.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794898606; l=1207;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=5K0UABWjOFND6xs9DWGmuxZoOq5M77EGBQPr+UnNUYQ=;
 b=Xe32ciWnZGcXtxS0CvQDauU8hxRU7Z6rTYywK2U/JevAjeb1leYaq66i+cVEfcDIr9bQwwuGq
 P6SW+ol0dF4CS4t2C8yfU0Ze+aPa17DSw8yEKybpeX+rYha7viQYRUs
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNyBTYWx0ZWRfX6vKo1UhQWNUY
 oWysCWJAyqAlRMnjDIkT0Ut9cOznBPC9Lqv7aDYwx5kQhOapUOMyG5KzM+ch+384CX+hZ9MWD3q
 8wkcZ33hKg62Docn90woSG8q7CKuzbudkaLQvZWiJV8EAWAiAWR5Cnq8NGBZh4MtGkw1zWJiU53
 X5Ct3r3eEawbSYDYrzii69SlW1HobTqPfW6xffhH45VfHF6g74KLV+U0+93JQyvhehc97G4HJ3m
 Ag9RbdOFsi8+rHS60y7UDORGTLY9K5hXr/lmQvDAAPvg56xy3KeTqR4eEmOlTVmfrMYOJXuznMq
 6fpCmrum7xCwj0Ci/pVIGjPLTTj8uko32hr7SSwUamWsm3TBWNGIg3iT84klocv/z9IObbECQN0
 Ioq9MMsTdcenvYHF9lK/Db6p84Uej2tqlEa0dgwFp2aoF5ho+jlqappGfZgYbdVrDcWqcGcySRH
 AxREcUvPy1Nzk86DCKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNyBTYWx0ZWRfXyYKiQ8EiYlXb
 HuwMXhNqbPJuHHnZovt6rfF+0ZZva7bHloRBIa2oJ0kPCnpZaJlYJqprmqavT+5lOvtFXnB71EJ
 P003oI2RFmIRsLe50++CVbUX9dRWIVRGoQukXai91dp7yuS0RzUU
X-Proofpoint-GUID: d-ZN5MkkVXy3OLmA6JRIWiHkz63Pz1a3
X-Proofpoint-ORIG-GUID: d-ZN5MkkVXy3OLmA6JRIWiHkz63Pz1a3
X-Authority-Analysis: v=2.4 cv=TsBzFzXh c=1 sm=1 tr=0 ts=6afbfab9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=ZqNSl3lnWbua6QxjwBkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=10 malwarescore=0
 phishscore=0 lowpriorityscore=10 bulkscore=10 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170027

A few small cleanups to get rid of struct page usage in jfs.

Patch 1 drops the kmap() of metapage folios. The metadata mappings never
allocate from highmem, so it is a no-op. Patch 2 allocates the log
buffers with kmalloc() instead of splitting up pages. Patch 3 fixes an
error message that refers to read_mapping_page() instead of
read_mapping_folio().

Tested with fsx, fsstress, and the xfstests cases that exercise jfs
metadata, the log, and the data path, on jfs over a loop device under
KASAN. Results are identical before and after the series.

---
Tal Zussman (3):
      jfs: stop kmapping metapage folios
      jfs: allocate the log buffers with kmalloc()
      jfs: fix the read_mapping_folio() error message

 fs/jfs/jfs_imap.c     |  1 +
 fs/jfs/jfs_logmgr.c   | 45 ++++++++++++++++-----------------------------
 fs/jfs/jfs_logmgr.h   |  2 --
 fs/jfs/jfs_metapage.c | 13 ++++---------
 fs/jfs/jfs_metapage.h |  2 +-
 fs/jfs/super.c        |  1 +
 6 files changed, 23 insertions(+), 41 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261016-jfs-page-leftovers-14ca23de2a6b

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

