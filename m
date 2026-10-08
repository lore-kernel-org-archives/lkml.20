Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D922F8E8F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791479860; cv=none; b=OQAnqOgDiC9he90UQei3YP9uejFVFOcNQqlTWJAw5skLSRnnGvBzdylPkvHNp3n6y54UI5I+K2icLNHKWSJRxaehLgNVbuMNjbppZkL7dlGOoFSekSSAggLDpFF9Edyuil0bK0+/8LUmMWOOY97/avt5gEBfpXglRppWVba/WGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791479860; c=relaxed/simple;
	bh=fa57BarLa3S4MwWGljw0T6+FFl5B5HOLbc1wS80I4Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aqql2NanRxHHLtG8nKWn3YBxc9Hj9+jbaU9mb/lnVjtGWcTAAeRwaPvXKeYQuuKPtxz5F51dw3chI/YbQSKacL2AndwjiPghPTd42EkrLm3d7PB71OK7t2tJmdnwHLjQiSUZZLVOUhNjoQFNbTe0kQZpZ/BdSReGtyCnAsTnZM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jS2HQWq6; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jS2HQWq6"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcdab9a82bso556892e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791479857; x=1792084657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o0PLYiY/N8RhjOEjCS15BiR6ywDnnfcu/szHv5dRujk=;
        b=jS2HQWq6xE8lq1rtpRL4VZta8mxVld5O7SU3cw6IQqEEKyXS4RgMR+SJQ9Z/KrXfPm
         68GJx4TxlwlnDhdx8t4RjExja2OQTQ9o0R7l6ur9h9n2aCBu7zLirWVeYJyi+CrP3yFj
         qLc02xh65SGRlfjaRem5xG1vr8Y6sKfAkc1YLxajNKWZXEpUbsh4T7gYvoDMYovjVD+8
         gBTFALTe4ss7OVj++8BclcdTVNYjzrchsnD8LpEpyrK6k5JB78Nzxr2jny/4VJtmIRJ8
         28HE0tPuMoeUVZT2ibOOYR9/rhQ5u/kpsFJ3GykFdMF3GkA2KVUdOkdwBUyQ+vnFpDrJ
         3SmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791479857; x=1792084657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o0PLYiY/N8RhjOEjCS15BiR6ywDnnfcu/szHv5dRujk=;
        b=d+Ti6FliQX1CZ9ZdDbCBxI1100FdpKa+ffKs0He6Q/6Zih5mv08jT0xT95RjLLfUFN
         r/pTtHgh8e+QfKKcFfeE++LrJGf+6e98JsdhjJixq+d2r7dCPDmkBHiyWNkr6/ddtGew
         Rb0A70fDU2d0hh7asOOhfMziijE29NDOQMSh3Di13yTOd6bWWCB/emGqzTamTIPU5Rak
         i6r6c4K6uqK5WECU8s7H2rMKyXreSKYf6lm1XygRTT5SX2NbU/EymmqouixaMDwQKSJE
         d/F7dpT/RIexZqRHrEiB2XXf1JTpAvuLq5ybKZnjw7b5rDoUo3vvmz4HviGnM+GRH2pU
         Kfag==
X-Forwarded-Encrypted: i=1; AKwUvBxJZ6wcv8ZOoiUY+HWdEsnOum8RHhlQF5e2pMpo7TwJXxZIRNzgDZSyCu+2ddHFE/jGf5D6iFEjL8LYaBs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIL792Gt0j7ALDq69hntzXCYxpaBaYiz5Qbz+qX/YfFNqjUO2Do
	7Bp7xyKxs+tSzZ4ESKHXOn7SP2EhHO/OGKA/ZTI1pJIkn83X3oqpTEbO
X-Gm-Gg: AYBFou31EYNBSrZSFCNYT8L9uu4SBDT5jMu9/PP7GfCFMSc5O2YGzcFRxjTb3zzL+KE
	81XhHAuy2vC3HB/YzO2uNl/gTmKbV4alQWsvZx7tsLcX80OgBhISFJ/SZWiaJLOqJLe5Oxa2OgT
	4s3948s2GP+xhyFg2zQVfqMcDQ5cxwcXPQ0r4IZwv6LrUzwA7MOQb7U9A/sieMMHBlkrP7LGvTZ
	XRmvzFwDV+9568Mw40shR88KvILAYzaPw6VPELZvTBqDLuFNkBt88QSsn9uvc3Kh4RnLHu6OvLK
	lFFYmOZH2U8XjZN+ShAQ4JHHVrBpgmH49k6g0uR2EM7TH/WsR943mlKCow2896nf6yZ7pfAYf1K
	X9B362R/MgIiss+YRL/4eVdgPCyWcEbYZlFeMQMgXXiom2a3YFF76dKyuind8rHySNbfHHCfF0p
	vD913Fyadezum0WvJmD5hbEWRr4n2OYYTLVtm1Lh0kPIRluigBe3RcQ9vs4nLfotwdYjyu3jLBH
	M+5vUnd2MRPgvDe35eq4udHdQP/VVasNWtEAayHq2bvxEAw9lH1
X-Received: by 2002:a05:6512:3a91:b0:5b8:bc5e:b57f with SMTP id 2adb3069b0e04-5bcd0712af5mr2293273e87.55.1791479856946;
        Thu, 08 Oct 2026 10:17:36 -0700 (PDT)
Received: from localhost.localdomain (95-24-167-79.broadband.corbina.ru. [95.24.167.79])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd3015020sm1497605e87.11.2026.10.08.10.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 10:17:36 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: bot+bpf-ci@kernel.org,
	bpf@vger.kernel.org
Cc: Maxim Skokov <skokovmaksimevg@gmail.com>,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	martin.lau@kernel.org,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	memxor@gmail.com,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	vadim.fedorenko@linux.dev,
	mason@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf 1/2] bpf: test_run: Fix false -EBADMSG after skb leaves CHECKSUM_COMPLETE
Date: Thu,  8 Oct 2026 20:17:24 +0300
Message-ID: <20261008171726.47795-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <6ddac0398e54f73f0d424069145c6901d8d0ff3401fb160db0a9e3b281270c06@mail.kernel.org>
References: <6ddac0398e54f73f0d424069145c6901d8d0ff3401fb160db0a9e3b281270c06@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 07, 2026 at 06:45 PM +0000, bot+bpf-ci@kernel.org wrote:
>> +	/* A helper such as bpf_skb_change_tail() may have downgraded the skb
>> +	 * from CHECKSUM_COMPLETE. skb->csum is then unused by the stack and
>> +	 * there is nothing to validate.
>> +	 */
>
> This isn't a bug, but could the opening of this multi-line comment be put on
> its own line, with the text starting on the next line, as is preferred for
> BPF code?

Right, will put the opening /* on its own line in v2.
