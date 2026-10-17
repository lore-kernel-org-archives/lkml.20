Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DBF2D1913
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792272285; cv=none; b=Dsba64y0mXVcn7OrTTAUsCjeaEdP7lZP0iQI9Ndl+Kguk5EY2nivU7tT42LbmONecp2ULN3hYYxLdPRcvgysssPd5rq36X1YTfFMlO4WHcgf7AYllQr30g14xTTsntttwE1FR/VXRMSgdMntij4aCKrj7nId0OPGxCkU6Q1o3KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792272285; c=relaxed/simple;
	bh=hrrWDiy/kbLp5k/Qv2kPUZiRlAw0Rqi8oEIC+VmD/dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lcxib/CWyDX+ThN1WQH1fMMOCH7lRycS+OCJqgXqwAY7fRTrUo0iyqCHnAsw6yGMDI+o6mdOe58bEnAbrOqmsUfRTUHrIjsP3XSVXS4aEJtSwMqUABcs/RLy7x3D3C0PTGX74LcsZ8kgKTzINh+F8LDfS++dxeuSkdJixEOcoX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=simpleble.org; spf=pass smtp.mailfrom=californiaopensource.com; dkim=pass (2048-bit key) header.d=simpleble.org header.i=@simpleble.org header.b=oloDkRbl; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=simpleble.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=californiaopensource.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simpleble.org header.i=@simpleble.org header.b="oloDkRbl"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-353804b591eso1607154eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=simpleble.org; s=google; t=1792272283; x=1792877083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrrWDiy/kbLp5k/Qv2kPUZiRlAw0Rqi8oEIC+VmD/dg=;
        b=oloDkRbltzL0V5rQA3kDeFKaW+6V47CV8m5uiPrJaIDR8G1Vo+VwWuPp+gTOH160BO
         G6A3zqNQeHSwbVajxBu5loyICLw+X1dW+qMinJ0rrZCPcZovm6ql69jE5BJHwjD1xqje
         N8D0/tj+qG6Ktxxa7TpGPPtNiZXUUCZq+9N7bg2IMnMzmwr5u1n98UZ9B3E2ZaxFHRmX
         fvpOJ8thQkAnT+MkVRrKsuoZoN99YdZbdaEDXTwbIsPje36OxEBhElK2/kww9qAaIGID
         zswWTkTjHXuXAwTb4/hepgQUFPcC/s2o1dWYX4fWJTt5Z38uvFoNL2KrHq5d18wHxHqr
         KxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792272283; x=1792877083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hrrWDiy/kbLp5k/Qv2kPUZiRlAw0Rqi8oEIC+VmD/dg=;
        b=MgtfobXiJTxzRJH7qVS2u+7T36QvLbUPxWT7niSXn/rbGBSo7MxpeKGcnYgVtnl37s
         RRhMWr56CnexJZkvqrkxhn5p+fWBUxcqb0hzhkZivb8I3GAbTrqE7Njz7KO6oIJhiD1a
         fG0GK/5p3jVA+qA5YVBEJLwvAtoXF0UKAOYvYAAE9wWPt7FnMPKKvsieX8kL82DGqwu0
         UkpRKFFAU3sdvNShOAdELtlIn+nz2FXnhwpku710ypvnBv2PiRB+7SKnVwwwMukf7Z9j
         GjuGP1+N1IFAgEQ8I/mFkiAjZKIwG7NP0JYB0psOs+eAKEGIvLm9m7kgDDQkffISpep5
         LoTw==
X-Forwarded-Encrypted: i=1; AKwUvBz0on4tPIdHi/wqpK6lJarip5e+B4K3HNr/1w5q3A5KxJb4X70IKNNuBzqnhLrsAacpDerMXQuAwFMVeR8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1jDAEPTzdmT+nL9jUXfIgfpUEFRRTpBbTdZjojvlBNSZC3eif
	CCy+mn5LJzBR5mkTxNeWP2Q+tcGFck6/MpdkHjhG+Qo6vnRJLF3fPMt60GyNy7k406GDt5/qQZM
	tyYJbnN8=
X-Gm-Gg: AYBFou1Fj3+S7AoE8Nrpcnnn/dJ81wtN6LcPr9CzOMgcuz8YJ3GOWSyQPRp+eE/8WQG
	sc8BY+XtH5kh2lR+6buSANel4eH3wewLNFxI+rEEt2FjLtj1Fef6s+AfxJk15cOkV4S5Do+Wjrv
	MK4yueHrnPozciReV4ag/7dqRsltNbaHzfKT+5hDhTlNTp5q2aBcPvj+zj1sxUS88Zr+PTZ6qJv
	nFdwVZFAwp3vDL7ijwUJAAkrXahftkebw1VibAmNH9X1s+L3Prbn4NvbrOViOTm8XPQvXJ2ipsl
	y5CwtSNk0wJVvWOYBal3FaggkHisQ5hvdYWRIVodUa2zwd56o8bHJjo9RzCiRmc+4HEomu0GxKf
	GPjyeF72Ii5jhfcuQLL+2flARe0rdSgT6zjTZPTRqQwTVMbsT99Wz2Zfvn45jWpkWvhjSw9pDOh
	ntn0CqmB9i/HJZy8bd0qZdPllgrdg8kqlbTTCvtw/7aN8qaUik/vRzNYFsqO0YThtk85nyCPZDa
	2WfirtwAB9OCHm85eWa1mmmMESmCiJbFDMddqKGs6BRB3hd6mN8BaSmCfbeFk16R9v0vNw4ZaEY
	Gp37G3Hb8PXfLf4qacsIc18KyDLAUL/y59JquDI3
X-Received: by 2002:a05:7300:10d:b0:351:1e89:66ab with SMTP id 5a478bee46e88-361a0e85fc5mr5265300eec.7.1792272282401;
        Sat, 17 Oct 2026 14:24:42 -0700 (PDT)
Received: from localhost.localdomain ([147.185.47.151])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082e81a06sm17563565eec.26.2026.10.17.14.24.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 17 Oct 2026 14:24:42 -0700 (PDT)
From: Kevin Dewald <kevin@simpleble.org>
To: linux-bluetooth@vger.kernel.org
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	linux-kernel@vger.kernel.org,
	Kevin Dewald <kevin@simpleble.org>
Subject: Re: [PATCH] Bluetooth: hci_event: Clear explicit connect state on LE connection
Date: Sat, 17 Oct 2026 14:24:32 -0700
Message-ID: <20261017212432.8372-1-kevin@simpleble.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014224145.10801-1-kevin@simpleble.org>
References: <20261014224145.10801-1-kevin@simpleble.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Luiz,

Sashiko flagged two things on this patch, so here is what I found.

The medium one: if Load Connection Subrate arrives while an explicit
connect to a device without params is still pending, the subrate values
go into the temporary EXPLICIT params. This patch now deletes those on
connection, so the Connection Rate Request is not sent. That is
correct, but bluetoothd only loads subrates at startup, from stored
devices, and those params are DISABLED, so they are kept. A failed
connect already deletes the same values through
hci_connect_le_scan_cleanup(). Moving the cleanup after the subrate
check would not help either, since hci_le_conn_rate_request_sync()
looks the params up again when it runs. If you want that case covered,
load_conn_subrate() could keep such params as DISABLED, which would
also cover a failed connect. I can send that as a separate patch.

The low one: the comment in hci_explicit_conn_params_set() still says
the new params are deleted in hci_connect_le_scan_cleanup(). I can send
a v2 that updates it if you like.

Kevin
