Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A9AB4973A2
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379400; cv=none; b=WiEo9Pxklza4m85fKN735E8MOCJT3hHJzosIdyP0QZ62mChmymd+j783EAx2jb0JlnYXCcVCaguF6FQS3Mtt2YkbbPsWppUQd4EewtOY9RbLM8J8BLe08nigo/roVw0h0jIM7M9QfIymWoluA7lDsJPDPZNehY70fDulbiQ7whc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379400; c=relaxed/simple;
	bh=rJMppgT9oJ3b/b9uCe7KYV8NZEdhB6dmkkmBGtrxXCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TA4onFprxjSDnCuozrSGJYLcLRovXA/9ggKA3KrZHwQS3f3hhqYk21EADtE3X8nNAN3W+guHdOZHH5lldb6kAqTdYntR/FHNKZDpbfGEjDrJrmxqeispB2C5udTKzeUBSB8OOzV+HEHw1irY1xTvv7tFe3T8VibZUc0nt6jLIeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=ddkzEkQB; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="ddkzEkQB"
Received: from localhost.localdomain (unknown [52.172.102.219])
	by linux.microsoft.com (Postfix) with ESMTPSA id B884C20B7166;
	Wed,  7 Oct 2026 06:21:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B884C20B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1791379326;
	bh=rJMppgT9oJ3b/b9uCe7KYV8NZEdhB6dmkkmBGtrxXCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ddkzEkQBmRndIGN+wp6wHJZ0gskRjt9v3xiSKpU/Fy9JxlR+C3MmlvRh2o2drRtI+
	 rBXY9nU71w43Sy0jrW3QWkFMNTO9ALpD5VZ5iFmEYcIeXfcacFa4v/enz7vNJaLRI+
	 C9ErtBCcYH7Zg6PoKxtk6H6iFcoyewvcy8LlfdI8=
From: Cen Zhang <cenzhang@linux.microsoft.com>
To: luka.gejak@linux.dev
Cc: cenzhang@linux.microsoft.com,
	gregkh@linuxfoundation.org,
	guojy.bj@gmail.com,
	khomenkov@mailbox.org,
	khushalchitturi@gmail.com,
	linus.probert@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mokshpanicker.7@gmail.com,
	qstrydom0@gmail.com,
	rayfraytech@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: hal: fix a multi-line comment in hal_btcoex.c
Date: Wed,  7 Oct 2026 09:22:44 -0400
Message-ID: <20261007132244.66777-1-cenzhang@linux.microsoft.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <d2f64843fa25fe259109aa19b1592d82745e40b9@linux.dev>
References: <d2f64843fa25fe259109aa19b1592d82745e40b9@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Luka,

Thanks for letting me know. I will drop this patch.

Best regards,
Cen
