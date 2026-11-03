Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722388;
	b=xAmoGcpMS6Iodt2VjUDKm/bs+jOhwKp3BHsXv1kExwx21UQbrXgybG+wlSr5ePTJqmoX
	 BNrqcoh5YK8o5/7eEgSURLue2KKNAGY1iogA2SX8Gdqq7eHmfkd4sRzYwjVhyNLIa2Knv
	 9rV7nkedDujG2pSTXd7EjCO5OcMAkgo1QsPbKgNW0I0W5tp8upZjIi05XWnJbwjQPZj6n
	 9g+2OUHP7aR6PPt5yW4k7ZYnAORpmAaoXXs1xRgNefYjaX1Piaj2/9p3R5Ke97YuSQv72
	 /iVHpOd+lsRE4xb1bIsm0U2gHy3pq8+eqeraXznEH6iW7LcErbWk07Hi9D+DpZH+6+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4A60JE6fNOa97bnDneZpx8lsHJBwZFk3Rbg33nvgKAI=;
	b=Efedvg+Y92OGUtiElL8JAUjp+09wEt0OCa8cGhIaJk5IQz2HHEq5taYuk/Dr6k/qbDGD
	 6rawJcU/NBGELNSsbcKTporHRZT1/I9wTqw7NA3kg4sDV+lVIOAITMwjZtXhI0v7gswuW
	 Wdpls/rHa1QO9yqsrWdclV9s9Yp9O8zC3Cu3bn2KyLz2eGEA9RxeUysj2sFSNwtODgMh6
	 mYNwbPCW0Gjv3wyk0XQS51r91pWxDFIGr1ozXBXERr7okh+Ovg0TTL3nJecBMygD8b8AH
	 aVrEf7qOSZZmCVjIIQPolsM6+J3V9wnijizK0kt1OOM6wXXeGHDx1lCYlJzg9cVt/UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CE46082BF4
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17CE46082BF4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2af4c8d00so6464846c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793722382; x=1794327182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4A60JE6fNOa97bnDneZpx8lsHJBwZFk3Rbg33nvgKAI=;
        b=LdNwM9++nZpH9bPkX/2oAdnFguh5iTi3E5a7BiV8CmYQluqvCLCht5gk7bkLsndu8z
         PZh8o5IVC3T92JoG2kQjC1MN1EMt2nFNycV8a2VTj336wF+cDitTXB/oYBB9eM2CyGOo
         mNEhyocQ3ldYpxx3C/Rz56XMppogmi2l746+j8iZXSBJai8AlFrn8cOOIEQnEud7rFjK
         NjXKL4tvfp6Ct44r2OPRAVEZAACXPr4O2DGPLli7Tu7wf4d83cqvvoeOUa59KsI27qAz
         0dmSQ3Vw3wktU4jQY1Kn2p1bDWDX48OzO+W6NPfERXPKkT4d3wW+jVyrPAEZgszSzv6R
         EsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722382; x=1794327182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4A60JE6fNOa97bnDneZpx8lsHJBwZFk3Rbg33nvgKAI=;
        b=mgJe23umdDUJRP0uUXV+c2AYSA/JZYvBLLX7cR17U47nn7OcuGgWzjcCTqzaHIWPbR
         Cip/rRUcHl4hQfubkumBZltzguLaFPRGObg1kw6EpYF7Sf5rbq/aa0+0mUckkPuT3xzG
         mhWH3/R+1eWw5TX4n6Cadcrl9b2tP9Ybbv/RrzLiuE5QwKlyMdgg8YAiuQsSYCk06a7f
         pACuEABjp3KF3HBAhFI6kaRaEgIlptqM/uPbSbFKUB1+oQAZ3SLxNBt4kkJ6mBVPap9O
         pz1l5k6qh8o/DDdG6LX0yvYNMiENq9vJS7/LbWGfmy/L3uVm/vhv51pyN46rBqELCp8r
         0StQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjrgRdVdWWh0YIJu2YN+b+D0KhfrnThWHeopXOinTW9ukS6rz5xMgFQAmxTDeZSRUYwRdImR2P0qLULiY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tKjJSWjneS+Hrx+PU8SxuTcicU+N9BPcN//CywzEfCl/5Epj4
	hDZOzJVUo0mnuOzJDc6coymXORKs/qJez8RBWCxUDHZ6aiUm2EnqEekp
X-Gm-Gg: AYBFou0b59a0Ic0ShfPX6WU2eELwuAbvVl6U8OQd60qiIxglF2aXgXHJ7+qfus4cJtk
	kfstRP9HLz4olB1Jd7Cd4rY6T8rhXLapueryR992V/RhGRjfetTepivh+XpPIlGzoFiElXgEmWe
	Zipps0SDVn6S3EEk3I+6RFYKE20n88pn7o6sJlljRYgXiFKXEBtvn54CrBdteWu654faTImMbb3
	IlcpAOqxBTMV590+dG5/qi33Igo2bOD1uUvfzM86d20SzAg7YLC6HkE36LubGqD0qHpJHwVQEtY
	0sDU2ZmBdi5wWCay8xs0IvXdXATvjm5f0rE4il/oCnZYm/9wx+XT9EbnkpILNHY3WsVqV+rRhLC
	Wnz0ThRIDzFhrbTjnmOa8lAp3vALiI8nTTwKhIc3pO71kEebzb9+nI5B9ZbJ2rLQL0X5+45f0Ar
	PthGwo9M57xLqclK3fEezA3Otu0vvr5KSfSXtLMAHwjkd1flD8qsWDittI0mxNfk/qAdAyPRIIh
	Zt7CeXg72kb/XSyjkagXY9spZUzRmt0eskErCjkLg/lxtMu5HgPrNrH+pLQgz2o6D9eU33UGarX
	yWk5HADJiApeqSOzT3de/PsOqPsDcx04EehYhLKKExuxknDDhi9ERoKxdw3qUeOpV8bpOnSbrVK
	ZKhyl3PJEvB5U3mmZNQxyW5yxmMOAzcnPt01uuK2HAivEmVEug0sZDpMRbttIIZVuEhaWbqmCyw
	==
X-Received: by 2002:a05:701b:4348:b0:196:d6e1:108b with SMTP id a92af1059eb24-1aed79b3f6amr15967359c88.10.1793722381826;
        Tue, 03 Nov 2026 08:13:01 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a13652csm50112589c88.17.2026.11.03.08.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:13:01 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: netdev-bot+sashiko@kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Florian Westphal <fw@strlen.de>,
	Mat Martineau <martineau@kernel.org>,
	XingWang Xiang <v3rdant.xiang@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kernel@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: Re: [PATCH net v4 1/2] genetlink: Reject joining multicast groups no family owns
Date: Tue,  3 Nov 2026 16:12:54 +0000
Message-Id: <20261103161254.56922-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <179372164269.488856.17448970060747076034@kernel.org>
References: <179372164269.488856.17448970060747076034@kernel.org>
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

Yes, this is a behaviour change, and I missed it in the commit message.
A bind() mask with an unowned ID now fails with -ENOENT and joins
nothing. I don't know of a program that does this.

Ido, Nicolas, is this OK to keep, or should bind() skip unowned IDs?
I can send a new version if needed.

The other issue, the window before the membership is added, is closed
by patch 2.

Anil
