Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9B5441037
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789907114; cv=none; b=hEmN53YURe97LEPaprwds9b3Mo7XWZe8R6j2s+Qo//3E6i8VZcgJKQHszc/pnBUyK1N8kSWoIl+qO75CGy9d98mK2Up6DB8HMydHqv7mJ7FAG+T/Ms2jMjo+Do/LfXu0/rx5VpoTaYdv0KkEh/IrK7ZDuj5/MQKz9l4RyPUAfCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789907114; c=relaxed/simple;
	bh=OG5lCEUgYa4YxqH+9PDo4SHEg58BB5hNYIqEZJkrC9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bJ3zt6+cS8YdsQ48Nb8h2mYpkS5x0nQnDWrTyxSBbo3xB7fs3LtdX9G68kU3AS6kPtbANJEZ9MvPB+MTjko7RuDJ/GupIPuWmeCR85XG8KS243PhE/aFkXGO9kk/5hqk8OIfphXr3ga+gwJBZ0+UJeu/i5deX2JKcWwcMk+Vl1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tOvWtYdj; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tOvWtYdj"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39b5b07ec78so1442741a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789907095; x=1790511895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bpdMVsVBLYjzWDTXbQjKSYrSvCe+sMnBTBU+TbdKtJ0=;
        b=tOvWtYdj7MkzM/Eer7eZaFdSnamAHoUIROCc6aLM7FzdNA/G688Gk/fxoTG1dQFqm5
         bpyS5Zqmi+MOs4FNn5jyKXOQPgDlhrKuC7wqw05sROKbq1Ht/XTq4NoM+R4LILxWMzZy
         Rt1TkpZV8Yt0MgF2/QSiBRAMbV1TiF10txTB45P2l47kjU4S1Q+iXlWCgC5855eydqAV
         C1CEISh2wZj2pzBP6387nRU53qDFemlyFsYlTDRlOHR5ELFT7CCTv4K+t2vnWYuG7DkN
         Mv3Jx3VSHhzVYaAGhYexihV5T8aZNWDK6BZNr7pr8sObpArHh8/AQalaDRF3+nIF8pr7
         9xgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789907095; x=1790511895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bpdMVsVBLYjzWDTXbQjKSYrSvCe+sMnBTBU+TbdKtJ0=;
        b=M35DW1mGm3a/Kj6Xm+vekmhkvUUTUpC+W45f+ugQj3z+JunTXhaoAJ4qiVzuSMtqdz
         whuy5ohlOjvZ0Kp0I6pcu5ckH3xeNvdyF6mTg1X8VDTaFU29HwcVpovTg0M3whjFIuGv
         LhUXBghNlNqRMXRVJ1gzcDYlecL8C07p7uXZ3AJEksZZbS7q55JNouTji9mQZXwwlv9Y
         Ytk2bnHR0/DiIveF+duf7v1p8ZB8Osb4jPiz1HZxDMII2DPo8q0mtts3+J1xWWegkZQD
         XhzD75FUhZi1bbUmN+mlrwNOe3i8kJKVkBXx3TDPI0bfIqGNRuxLuIGs8+mlLNNjwVj/
         I4/g==
X-Forwarded-Encrypted: i=1; AKwUvBy/kcAcfGagJtug0XlQyECgjS54KyqUmH7y2Jg1xsmRc/mjo7ewnopLT4cWnWUOPe7k1AdPDs2UJ3BqRWQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kmSdfZUEhxQMPnG/sY2wggh61eh6+yi9Vh2cPaVar9iD6DBmeD
	Oubjqqeu7VvAK+98AH36uRgH/WfKsHc6zC2P4emC5BQj1krlC5FZeT0=
X-Gm-Gg: AYBFou03ZIM2nroKbRmN/vhxXxppKF+K4RbTWMBlrnn1djCme5dHZ1LpzgR8l24Lws5
	BEH64JvcVrhCbMxxe7MCmLKNzYYJAM0q8tCCiau71Eo1jeyBxS58sikZ80ByZGWBCopbrkVl2PO
	oyff8poIQb0qQpkQxv2jJQfkY3teGFcgG+u5DMC48D1fo1Cmk7yHY751QKsgyshQEEvgPFpecxh
	9mAGzd0yjllEZw6FaQ03MylsdIOVxMriLKnzTa09s9jM0jk+edlMoSLJk5cNc+Oaw7GRqd71nmV
	PaP9o922Tw0G6uK4vXKBVX3ikY8Jr5NVWNKSjmG4bbXBhTHFoL5NLif059SyYikKSwgoqwKmHVT
	CWix8+5offB+QgWfpL5/LhpD6ikPrzK+/wYtGo462MTU+6/t4ZSicWd8b5bohnp/Rmbhuss3ZPu
	vDRNJPZuKXf5ZFbujSrGr9DPd3nDHGbxxI3lBLQwLNjIwlnWdN0/b8+EmRSL+FQsBMhlmg7deGq
	bawDjCuKTfK3yN9cbruW+3g8DQ=
X-Received: by 2002:a17:90a:b82:b0:3a0:42a9:9c82 with SMTP id 98e67ed59e1d1-3a042a9a040mr609569a91.43.1789907095575;
        Sun, 20 Sep 2026 05:24:55 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:e0d6:4b87:c472:c9ae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145e5sm9445857a91.5.2026.09.20.05.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 05:24:54 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH v2 3/3] Docs/admin-guide/mm/damon/usage: document the temporal tuner's quota limit
Date: Sun, 20 Sep 2026 21:24:48 +0900
Message-ID: <20260920122448.610319-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920104921.48065-1-sj@kernel.org>
References: <20260920023111.2466265-1-donggeunyoo.kernel@gmail.com> <20260920023111.2466265-4-donggeunyoo.kernel@gmail.com> <20260920104921.48065-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review.

On Sun, 20 Sep 2026 03:49:20 -0700 SJ Park <sj@kernel.org> wrote:
> I now think this documentation change is better not to be made.
> Correct me if I'm wrong.  If I'm not incorrect, could we drop this
> patch?

You are not wrong, and I agree.  Dropped in v3.

Thanks,
Donggeun
