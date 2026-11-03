Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718909;
	b=VuKJtKsO68Myom7v+QAgkPdwHGnmTZ93gjNY5p6QpAllFZSK1ZPaeN0PTNNp/8wXH+QD
	 ZAQPWQ1aR5JAOnweIyy69kjDdednNmu3ErgNcqNi7hNBQe4kxa2APxazZr0NyEbpbF0T1
	 zMrHlLY11hwm42GZGKI/i6IH3z/bHnj6+uiT5VFfRcRUWAY15rs1/FsaVBWHda6qmwvez
	 LxjqdSaEs8UHFmbTJDVsho1NHc6LycGiy0NGiPViQUynHHZVQq1s3/l5ebMOJ/sXZwGLI
	 CgeckTplOwxninYC14H4BnxINsWER2jikbaMDhujYg5/StiTM65BOGPLSf8teg88N+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0ITYl+rOqu3TiTM6XNUquDHS9Y8miHjXHyuodM/Mz/4=;
	b=frTxafSc7N74lDw3LnQ+Old//1Rt0GYkxYRTGjf8O0rj14EV5im/oZzYb/NvdZfdrF+I
	 R9agRFfrPMHYWu3cVdS6vNYD5yMCYmoHh7Cl1OuaMGatCY1CNDM1bO12iEzY3WVcRlywc
	 nPQaICdxox1k/1OFivqQ0+bQVnEvXcUD0HmNdhmBSkZXggW1XFF+KolREMeEdCYrkMCfn
	 SZf3HgKGNzJWeeaHvySu8UZplopVyRYbrFTbnHqOQZYmjcb2a7iL3sNw3XXo4HT4rfFrt
	 LfHNCdLC0UyeZoT1KwFX9IRv1oURMbCEL4+TMH/lQALNR7Zw/FbduHMhrcywDffa8Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BeeXU6Ok;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1585606EEBD
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1585606EEBD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BeeXU6Ok
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-369f33df08eso8178750eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718908; x=1794323708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ITYl+rOqu3TiTM6XNUquDHS9Y8miHjXHyuodM/Mz/4=;
        b=BeeXU6OkzKGnfW/POjev32qnKH/gMT+0XeuHIqq20ccQkYfKYgxEfPZDAaOS2iCZbL
         jgUdaO+2xDNxE9GAsXDd2FonH61bDGgKHFXK+vMrgcx7Tp191NcYVZGOz8JAXZK56+qK
         oRh0r7hg9M6oSNEx/Jud6/rFJ/hzrmAMWQYfN2iAkfj8ChYRazV23Vx4yTbhSx0cjiWy
         5orl5u2aWUaMQIlNZZZQjJgvAvHAlfxfe/vTGDzzIAn8RuvHqntBvMA/t+tXLhDOSTvR
         wKx3v2ySFFqFcv/n1LPoycKxamKUiSPeINetKe4ADOzXs2LMEO5MMj1Gtrcf4JXTMLUI
         /92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718908; x=1794323708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ITYl+rOqu3TiTM6XNUquDHS9Y8miHjXHyuodM/Mz/4=;
        b=Owsms8pijkxTVn0GHXgqcKHhl+Df/IPszTzppKDNBuJVOPSrvaQweHpP5A827qe7PX
         63w6SgRUV1/Ha3p3MKMjsg61NL2Ua/Xjrmb/wRmIrM7WguNqO1H9D3aLR2yS2IChKxWR
         +87kfSkWNtIfSlMmwv/aFn5XBeXwRELlD7E+YfvEA13lShqievD34dEkP2jdjtXepCc6
         6NaCyE0IScO4EJFBfXvzodmypuU4J3hJcMH+FucxyMUkqiwFFWecX2EyzOMpL8Ps1rpC
         LDInjaRPvbHF6GIXkqazI1xwyssIKkXD5SL/v10lQSu8haKGD6a4oUo/83H78OXudj2S
         xfxQ==
X-Gm-Message-State: APuU4Z+Pn6PTi9uP77P2IfcOYeX/P5CLjNLJM9Sl7JTd8vl8Cp/EMvp4
	22qaOjuSgriaZ25B9OfddA+kB+v65EzIr9gFUIt/yCEnPCRUDvKKrG7Vtar3xQ==
X-Gm-Gg: AYBFou1dWJ+/EDaaxYpQPMm3ISchFnhCLqiJeVBXfWdo74AVOJeuA5pyKl+RmYNF59I
	et6820GsIBipmAIQxCgJ7+MwNTMzr/c36Q9cz4KzwcJGQ+k7kCBJT72nMIeDFa7ydIydW9jCsRW
	vDAGa9Q++idlfDiozRc7BnGKkuuD6cUxlWrYQ9DN4SE46qFI2k+8hfsd0Gw4LRSphSJDsJlgygV
	vXL1BW5RWNAwpgwGncYboP+dDpIqwAXEBwSLPH70gBHhSomV1YqvVBMYM15vWaee3jPInuj1llw
	TXiYgRJx3LDIOxA+CBwLZtSzf5UMfd2JYEgh9wSsYCfR8aB/4qulbBwhKFee+N9a0i7Zkctq37J
	q1ZAZAwVugUd2xTnE/4kWUuA59hIiRBcUxeblURA/ZAhb9UUy2dNiSDs35AEkzvfnRcK9jXi1Vs
	/6RRRDjt0VhkQ7h4gbZsvrgZjNyyO/o3gWvqSNEhPzdR8RsY4QELe5VOyQmdL8yftumOBX+9vYM
	cp1JkdT2t8QSK/HlliJWlXv+G4Fu6rnNWEFEtDa3r6crzEx8Te78TSSjuXSZEmurqNLm+C9PL91
	rb3TRh2AJdkn4Miscu/un5tGjKcGj19/XxdjwHfKtfdxfIByrwdkwky37N70dk0aXD+O7h/z
X-Received: by 2002:a05:7022:f115:b0:183:7d42:cfb5 with SMTP id a92af1059eb24-1ac5d88c1famr18568123c88.19.1793718908034;
        Tue, 03 Nov 2026 07:15:08 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm47518860c88.12.2026.11.03.07.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:15:07 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: o-takashi@sakamocchi.jp
Cc: linux-kernel@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net,
	sreekuttan2156239@gmail.com
Subject: [PATCH v2 0/2] firewire: Fix out-of-bounds access in CSR iterator
Date: Tue,  3 Nov 2026 15:14:19 +0000
Message-ID: <20261103151421.7248-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103042408.GB1229640@sakamocchi.jp>
References: <20261103042408.GB1229640@sakamocchi.jp>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Takashi,

This series fixes an out-of-bounds read in fw_csr_iterator_next() and
adds KUnit tests for the CSR iterator.

The first patch fixes the iterator by checking its position before
dereferencing the current entry.

The second patch adds a separate KUnit test suite covering:

- Iteration over valid entries.
- Calling the iterator after reaching the end.
- Iteration over an empty directory.

It also adds a separate Kconfig option for the iterator tests.

Testing:

- Ran the FireWire KUnit tests using:
  python3 tools/testing/kunit/kunit.py run
  --kunitconfig=drivers/firewire/.kunitconfig

- All tests passed.

- Results:
  [14:47:14] ======== firewire-config-rom-iterator (3 subtests) =========
  [14:47:14] [PASSED] test_csr_iterator_with_valid_entries
  [14:47:14] [PASSED] test_csr_iterator_at_end
  [14:47:14] [PASSED] test_csr_iterator_empty_directory
  [14:47:14] ========== [PASSED] firewire-config-rom-iterator ===========

Please review the patches.

Regards,
Sreeraj

Sreeraj S Kurup (2):
  firewire: Fix out-of-bounds access in CSR iterator
  firewire: Add KUnit tests for CSR iterator

 drivers/firewire/.kunitconfig               |  1 +
 drivers/firewire/Kconfig                    | 12 +++
 drivers/firewire/config-rom-iterator-test.c | 93 +++++++++++++++++++++
 drivers/firewire/core-device.c              | 10 ++-
 4 files changed, 115 insertions(+), 1 deletion(-)
 create mode 100644 drivers/firewire/config-rom-iterator-test.c

-- 
2.55.0

