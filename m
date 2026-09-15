Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6811A24886A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789431767; cv=none; b=VO4E6oOBEHg48ZQHJDhrYsKydglChYC9bVFjTV2Kyahy70KZhV8DeogI+dJNMV5b4aUhdeJEfAJMHTs0Jsu7YJsltw0AJqI3v73Soz2m+45mW0JSVhW3bkEnepH2B0rfGaaGK9pPGXqGmYvJeNo/sz7LWq56AiZeqNxuoHzG4iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789431767; c=relaxed/simple;
	bh=e8bAgtYfHJgAQOZuFODxHHUz0LVRi68vTtCmqYLSydo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pKJ63akIPP+qtTU8wc16DD86v/DSUFT/F5HTU1/8/dushmOFMU6SzJrBxl9lLadS7ZgVujMstp8PDgWANfUAPtuOEq7mirTMIxJfY/fnJUsv9jNhBl4g4EgkB9D40nizWsoSZFbseS9ELqV/gOfnVZDjvHZxGNreMce8LnbuesM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bu67FRfb; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bu67FRfb"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4bdf8acd6so1952067a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789431766; x=1790036566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GeIop4x7wAmOz9vw9e6Ff3KbDI3nGiNHjsJHqv4/nyo=;
        b=Bu67FRfbBPIfyolaGtRaOm0FSvzS8DxBsAda08FeMrAt7ICsT9ScSJsVNdZot7gq8d
         7WV6J7WN/0VgRoW5AeVHyt/mhqKw8OLGYBKMr/D235lMecUN/CXvfs862COg3bZFIS0r
         Ng1ntKehPkNO5y5PDpsF9B42WrnX8Si/a79gFfQc/sz7kdMj3ef8wd22Ce7oMHkxfhUE
         QxfYLH8Ih3/pF9GNhHOjN18D5jUPynSaXj1gmzC/82pnRVOXgOpggJ2nAf0/PFpnoGl+
         X+K5np0+Lx1EtFytjI6Q15kynIOJYCAk+fb+9R++l2qJXJRak8Tb9ja2wdY1qUdGp3P8
         0lsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789431766; x=1790036566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GeIop4x7wAmOz9vw9e6Ff3KbDI3nGiNHjsJHqv4/nyo=;
        b=gkpxIXhdlAJuHeg1cdG4aw3QhiJasFe5c4jebxZeDFXHokswfesz9ZwoMlOfqe+4o1
         aD7rFSWN0fjtOGVERPxFRFSh6puI0BxFxYLmrxuyusGanUItt5gEf0jIjmTayhcMHapB
         i1nteU1WPEH0/svCNDZY1b8AMes1ITdlayhMNJNnSnXr6Xpv8gQp2U3WeiCh1aV1jLm7
         +0X0SRenYwqaoXbMMIlvvJb0NK79pxJmFE3O1qcozmxeGfzwpNbQgvduA5TTyKvO8UD6
         o8rg3cYh9CDppqmUoNC9RMdhvzgk2yTtGHFypPR6+wOhDWfFUGZbJ2FlGtyaPLr3COzJ
         Iwbw==
X-Forwarded-Encrypted: i=1; AKwUvBw8PTiFW2PSWv1281PWTWn8+hasNQOqA2NYHbpw8kNq+oN5fLtrMUwyfhDBoW/lvWmd+rw8M5lLWJTk6Oo=@vger.kernel.org
X-Gm-Message-State: AFuF++n67+IA8L6zJUvFym1E1nydPdPXe6wLbzcWszIrHcBsnxMx2RjG
	8F8mxZ2ymXle80dDPmUA1YLP+vAgl8JxHevp5hep5mdYGnoAVST4Oq3FbUM8YrU=
X-Gm-Gg: AYBFou0YGP8/d1Y/I4+KrpSK9s3QEhT5ZGDgX133ZEAvHF5U77S6NAFhYAxU+H7zZK1
	SRZPbTRoMZuQUo3d4FhTMbLBKZljnKnuXjBPHzLzW6zcxKbMz7Lhu+KdcPXUmrYhvI1T1JhNI25
	AKK5rxKuu63+4+egrDIB9J0IPabXduxsVAD2Xeg0dtrOIGhMVxZXzcF6Aw6DHdbH37bQnblIPWi
	C92ReySAunZ5CoFRNHr34FKLdkuono4HmcEirM4DGJei0j8XO7wYjcwgBZS8w2eyVtilVrtbbR6
	n7KCLipcJ6bDqCWisu+fk9tLVs88baXqv62sJcgqKl7K//ZZCH1UAZtn3V3aPn6UyLMEPuC2oNS
	63hVnOKlJRMglj2c+8Kyt8dBGvYHEM9lO0S9Y+4qx2McPTGDo07Tj2NnPynVyQhV7BlC+hpyfj3
	rILYZMmHEs158AkgsTzWUFvABR00Swom4hQE1r4z/hHXILxnqEUNHsw8N6JzbTPW5nSiobZ8sEs
	vZcohtqPQFc1/xNNI+ZiFG4ODg=
X-Received: by 2002:a05:6a20:9188:b0:3d3:adbf:777e with SMTP id adf61e73a8af0-3db406266e4mr10443186637.19.1789431765692;
        Mon, 14 Sep 2026 17:22:45 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:556:537c:f7cd:8a1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e52a60sm28991665eec.6.2026.09.14.17.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 17:22:45 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tom Zanussi <zanussi@kernel.org>
Subject: Re: [PATCH] tracing: Unregister field variable histograms when the command fails
Date: Tue, 15 Sep 2026 09:22:39 +0900
Message-ID: <20260915002239.3685228-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914110753.221E61F000FF@smtp.kernel.org>
References: <20260914104036.1768529-1-donggeunyoo.kernel@gmail.com> <20260914110753.221E61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> - [High] Error unwinding in event_hist_trigger_parse() causes Use-After-Free
>   and Double-Free of hist_data, and leaves dangling trigger_data on the
>   global named_triggers list.

This cannot happen on this base. tracing_set_clock() runs before
cmd_ops->init(), not after -- 6ede78d0563a ("tracing: Set the trace clock
before registering the histogram trigger") swapped them -- and the only code
after init() is the if (named_data) destroy block, which cannot fail. Once
hist_register_trigger() succeeds, out_free is unreachable anyway:
hist_trigger_enable() failure goes to out_unreg, which 92383cef6679 ("tracing:
Undo the registration when enabling the histogram trigger fails") made skip
the free.

> - [High] Use-after-free of the compatible hist_data when removing a target
>   histogram that uses field variables.

Real, and reproduced under KASAN. Fix sent:
https://lore.kernel.org/all/20260914234754.3676905-1-donggeunyoo.kernel@gmail.com/
