Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793601912;
	b=m933IElhgE0NQQL/0qDMc3M1YoZIearp+EwhY9BKzd32xJOmZZcz5A03szND7i6COHw9
	 9hNbC4chlUffToY/Sv2+IN/uSMX6avi5wu3FfmnwPuqUQRlFLAksF2k+py9ayfojSSU4E
	 RfsAY0HjTMBTteIoBpJk6Y6QqSMCNK9qzmd7rjRj7PiFmwJV7cQr35emEIM9zLydC3vRL
	 NLKhVrqgR8VpwivedY8ir2Cbiir5B1GS0bw11ezKPbJBcH3UTwqWakiXZo9iKuvoO7T89
	 7ThUqolNC6SM92aMlIB2PQfo6zHyIwAyCE/AfkkQxCokJ75wBB+1OjNXUPpfxNBI00w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793601912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wYSeS+pXQxZ3Z/Duj+UwRgn3a2Q8lpcB+5N71axnhFk=;
	b=TFAIX2vlYin43tfN28jsi1lkXg61+aF5q7e7mEkk5TfdyzVasPRU0p9LnvaWBzELorng
	 hHGPomlhYwq/mAvOe9e/1T+fyFqudoOxdzYXrCymYxEOYw1v859omYtimTgy5KGBtqzV1
	 m7MDFmLZYMmsESooLfo8bRNia+rVFAeb+MzVZmnwWLVkHSDizqEjjiaPWxqinhhKqmveH
	 vVKCjNehMYxX/XKf/j+sEalhFNW1hsTr0Y8oa1qMOFW+mwxft2lnEWy/WKjtf8cYi4N9p
	 qaNR7q14ggQr8oSGWffNN87vxjqQu6hDXRCXLt9AhZhxUoVCfEq0sMvYpdLvzJiYriA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cgv02dVH;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC901606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC901606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cgv02dVH
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a315ed211so3267250eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793601911; x=1794206711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYSeS+pXQxZ3Z/Duj+UwRgn3a2Q8lpcB+5N71axnhFk=;
        b=Cgv02dVHPYSOuatjj9zZNevzYt450wAazU+/27A5tz+jAHB88mKP6f2COMS28wXqlu
         HzM22O6R0a9I7QBkocWHMJ3dZd0vxbw6xQpwi+SbcTKs5rPyA+qUkmwJC/1WqDWTYMLn
         2oP5DPpTYhE5t70mEMIfwbW36mUXHaYueBhUlNmQBhZnO7wMF8IhCOxV6PRT+1jGOYf9
         UWg1zL1Unl2kK0ikEiVY1uRcyCYFl7L2wjF7YkYgiJ6GVHZNuNE69fuhwqay9aHgkiyM
         L3W4j06r8aKFtFykki9SJSfReCwp0ILwaYybQCXi6bp1CMxQu7CRwKtiaXwdPCj9k7JQ
         +zEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601911; x=1794206711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wYSeS+pXQxZ3Z/Duj+UwRgn3a2Q8lpcB+5N71axnhFk=;
        b=M+59tu13p2MBJbn7itHQKc6o3q68NSotGjbOPPhpPOyxMx3/KDmfEc3HYrxXKTsF6k
         li6lyIAmsU3DBKvbBVGHjk8Bpq4BXxukH9ZDbw4OyyKwQ6K/dg6fOqqPRZhytqXhcHYE
         fA/x2+nMVRHQciPmeioJ+XkJANhU281OQ9IJSiMGMu420DfbVSjveSQ+Oz3IM9ih7Yp0
         zFeZhjQDFplVP88w2QJO4zWnw1q/YprWKpksi5p1o83t4V3GkVjigkqYbj7hpazCT9cr
         07G0olA2GPZXhWkN+pAn/zNPfyZHNUHzbM6kFYocoBnhHycg4CWj3v5wXtHgl+Sf3nrP
         lfjw==
X-Gm-Message-State: APuU4Z98weKKNOBIxRdb2/4jEaRWbjDSk6Ye7gvuNgLgqkH6TwBRPQIh
	ZPfXa232mdozh1SV1/8Afj5RWOUNymoupvxTPjLO1B+jJRcVqS5RV8Sg8agaLQ==
X-Gm-Gg: AYBFou3j6KfzL8Yxuj/lG7JJLhYzv1atZnm9q4KSz9F7iWLK+EMbBKQO1aDWDa738Oz
	Mu63vWS/acEN8XR3JFfCMpZIEqxMHYR6DItmClFwG5Yak6VFNr6VAagmvMa79s5kvg5YQ42gpw8
	EG+ZJfWX90mbjYUQZQ+MAkfEkrkWkEeT4S6mempaOltaf36vFg/rgLjjyTRpheUGD4roFVdIYJH
	3VzMldVOG6+o2pJem3B8nH0CS61KLCCvt3K4PZ1YUrHyW83lNblaQkAUh+olPwCd4EvXIUCVD9Q
	WhHOTUlz0TVx4qDD8oBPtWqkkUJwWFf/lEXiYjCPg5k8SZT4T34zbw7BR3UFxI9kybjmExp9pSE
	KEw31AfiGLhCZFmFTPSoQEJm0wkVdARbglnHJa87saI3M5ayr8NboEiLAYmPwViKH9ZxgcAeXJN
	6/XRB42ggPvlw1EAbUd8VIPVR691V+smt892lICWh1JzB4h+/u6LPDi+BfR3tqbxvU/P8xpicDi
	he+/SM22A7cTvXHBRz8sAU49BCjD0KXwZIdOU+yO9MUmRWjNDfJjKwJd8NgjtHQAwPOo4m6r8h9
	PtwZ2tNAxZU6YQ8WFeRqWOcvBhYInkbFE+L/R0jTyyTLRNmFGol2k8j1QU9/fa5j59d/sfSPgA=
	=
X-Received: by 2002:a05:693c:42cb:b0:361:cd8f:7422 with SMTP id 5a478bee46e88-36a423c09b6mr12780535eec.9.1793601910735;
        Sun, 01 Nov 2026 22:45:10 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm36632890eec.3.2026.11.01.22.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:45:10 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: o-takashi@sakamocchi.jp
Cc: linux-kernel@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH] firewire: cdev: Check return value in ioctl_get_cycle_timer()
Date: Mon,  2 Nov 2026 06:44:34 +0000
Message-ID: <20261102064434.3008-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261102043629.GA1188344@sakamocchi.jp>
References: <20261102043629.GA1188344@sakamocchi.jp>
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

Thanks for applying the patch!

Best regards,
Sreeraj
