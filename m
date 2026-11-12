Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451236;
	b=q/dzGMaWybd0FwZJrtnj4918ggF9IeAtnDeVRE9nc+l4aRqSc34xpuiMPsftBaC8ccPj
	 pn+jLqcIaCAZw1kz5vULYtp5Pwj2wHSKbDSF6J/0CVVClsLx0H7u+M5vJXAXaoDMLqTut
	 xAVdNbWb96tikkfWolNmyJGm+LLOsH3YioSE6l5WLF34khwc242Sp3ple0B1BZEAW3uuh
	 SKw0j7auxnmRBHBwW9kiqLbRDA2l7L1CX+kUakp5rTZvuHSA4MpXxfk6AJE0ZerEGGA3k
	 E2t9WfjLgxa+15JFiRpZFw5q/zKR0dhQ6Q8ZrqY/YBJiiNZ8+Rq+w1B1FkKAk/lwYHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XCG/hpoNHIW0Eu98Teji7EwKeVbJHc3B1VUMeilrzfc=;
	b=ojNstQwypzFZ32/+3ngnBSdOWqRjVvZwacz4C+K/oHCaYw8u4VR1YAt+gCICp1/77ikv
	 i1hTaeHSoW0EtRGCIuu/sFyJPQ3RDIGhYYyK3LH4HIROkN9u6qRGsYDpuPxgY2DF6qVXi
	 X07/JfL3r60HaTrZyWx98vR1K1lnVOutAPmcM0ZmStb+kX9MbmBpz3KIoBchpJnQMt0pF
	 fkuugqC+vZoTH9QQGp7hwjox2DAiPscrdldwtAQl4YftsJZVMbU56e0r6BstCC41UBbBr
	 B53UMXE33CirsERY8XbmQ1lkwBK7aZ1IclTuUG8kDUcACByfF71eap5kKvR2tQy1RPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VfT1VovT;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F7A606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F7A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VfT1VovT
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2761c69fbso6606816c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794451235; x=1795056035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XCG/hpoNHIW0Eu98Teji7EwKeVbJHc3B1VUMeilrzfc=;
        b=VfT1VovTUsPLuCQ7MctJPLbnqZlFTk3uSg1IvRBBcNsXsLUIKtblqmiPg8zM2YlHx7
         Aqywjz2lH85piwUeLNxNurLql7LQHyH98EtzkzVNeZfljO1rl8ab9Zr87XdXc+hWwNpp
         HnSUuqf2c0mcHIWdgET/i5u8dBEMbj0NNHTA8SKLbFRK+8+EZgUtXIVFHQnjZmeYbKGd
         YkBXb0+30fYVllP6gBZOd3qlem+T9T99ynpqynMDajM9BLmQAgf3tWaxzrgZ5er44RUD
         p2hL8JT1gnRdHPkDbo92SxAvtONrTJ4k/qzSQn3ilY9ZssKhtQbqKXeEuubbVAkaJlf0
         zMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794451235; x=1795056035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XCG/hpoNHIW0Eu98Teji7EwKeVbJHc3B1VUMeilrzfc=;
        b=fOCsB8t8WxWcmy0ewkLgO7ZoK+zqHuxtZAKW0QjqeRhFOeXpWJptwodTeUh9ZD34eF
         J3heajsS9wDVtT5iddPE7k5jrHwSuNbgtWKBhSmZxyOuu23IkDbkHf5h0whU/AYvzwuU
         rRjI/fTZOu4fDbiDlpe5y5vhQ6onTmSb3dsspHLsYzASOGlrC8pes++eo1EP7Gu+ocF9
         F2JID9cRd7ws6aUDNotttZYQEuEguUnr8Em1YxJbp8LD1KchPdL1llF2kAgomLoI14Kz
         VwaSNf3Xn/imKumXyD2ocjwD1bVdV+1jSN81T8Ncae3NX5y2oeDzX3Dkzd6n3ARyxT1+
         TSqg==
X-Forwarded-Encrypted: i=1; AL+hErE0ARZhYwbmd52OrpnsEMK7mO9yD1Q3nBtkud+XQmfnmkbje4eIUNr8VcZ0IUSY7fj/IgVKW4trY+g2ChI=@vger.kernel.org
X-Gm-Message-State: APuU4Z860zRQwoNCnJL0mZqMsmptyPFJMa7MBEpTSzWYRe3ziAIcMO2m
	CT6xtIOr8Jmlp1P/6wYYwJMldm6YmfJFuriF77WEKV2tBs42KN9F1k27
X-Gm-Gg: AYBFou1IA9r8yc+c3LlI4r26GT7h8WMJUv0kQoYfhuzfavEnf4OMcV/biHXBQl+ri/B
	NgA+TRIYG6WiNhBMoQ/DtcwZ+7v0UwR0qGtngveEsNsN67dMcbRz/RuYJhkIrAZMHJPg8TCQjY6
	sVQHAk6YsVmPsqWN6//tKS88AS0WumShOmE/gH9/ll/ySDRN3qSheMMhK5Hh55UNCgQj1zN0U3V
	bi6rr8VodnLg42/swi2zVMrHk3dpLSCCwNgtfidIIWs7W9txCTeYq/Om0sxsZL3p6tSEkkSN2bM
	7aijUFOjhnIj2PNNP0qqae+6Pe62lOJbfrtVEdhd9zNvlKhKtBgNO9HLB74l1740BGRUdRIwTl0
	DKno3ka1nqw4sv3y3VS2WYhfVedaKYxUXuydkSJmQDrhfpyXwZPUokXUVl/9glHmTxsNPa5LlHC
	Aoj7gGUFXQJZkUnV1gHK4uBVSLTjrdzdLZiKlLpCSN6oIrTK7O0f4GTkfOY5fpVlrQP89/3yK+x
	AB/hkTEscGpF8QPxkFwiZ3WH1yLdt1XVWbd84f+x3pvJFa+zq5xX+xaXPR2dK/oegFKVocfveaR
	tVG0nucJsuD1zfjAbFgrn7OwrdrCE85cFp9mHOzruCW50VwzKhgs575xy7Jtbugf7zWZktC8GaP
	WKIAZJK96wha1FQ4OUADua6g6/L+8Sw==
X-Received: by 2002:a05:701b:2219:b0:1b2:4378:3545 with SMTP id a92af1059eb24-1b3c0304417mr3841493c88.21.1794451234580;
        Wed, 11 Nov 2026 18:40:34 -0800 (PST)
Received: from thinkpad.tail59a646.ts.net ([112.199.224.229])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b1003fsm19000961c88.6.2026.11.11.18.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:40:34 -0800 (PST)
From: Hang Zhengyang <hang.zhengyang1010@gmail.com>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	x86@kernel.org,
	kim.phillips@amd.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf/x86: Reject pair-counter groups with no GP budget
Date: Thu, 12 Nov 2026 10:40:24 +0800
Message-ID: <20261112024027.3678221-1-hang.zhengyang1010@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109110356.27709-1-zhaogongyi@bytedance.com>
References: <20261109110356.27709-1-zhaogongyi@bytedance.com>
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

On Mon, 09 Nov 2026 19:03:56 +0800, Zhao Gongyi wrote:
> AMD large-increment events reserve an extra GP counter. A syzkaller
> reproducer opens a perf event group until the adjusted GP budget is
> exhausted. x86_schedule_events() then WARNs on the unschedulable group.

Tested on AMD Zen 3 (KVM guest, tip perf/urgent): a group of six
fp_ret_sse_avx_ops.all events hits the WARN without this patch and not
with it; smaller groups still schedule. Without your n_pair fix the WARN
fires only once per CPU.

Tested-by: Hang Zhengyang <hang.zhengyang1010@gmail.com>
