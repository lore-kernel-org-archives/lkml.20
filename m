Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922903;
	b=Z6MyNA95iwFRqsJqoK9JU81bY2MB3XocN3vnFMKappbgfM2T7sf0AeIchE1bTT5W+7j5
	 qAuhzlvSed7/jbgfqvjZjF9FCVvEcuJ2500Sn7dSntysmmAWSi4Z/xQ3StNIJqWsE67j0
	 s5Tt3g1qtJrLG2yizW/qcNMjH15r3ASOAOSRqPXlmM6fIklYlzzVoODSOmkdOdYWhY3Lh
	 V7ox6esam/b7csu42IyinTSRhZQzzk2Gvn7GMB6g4muzIVTEuuRrXn8fYnY+mtpY10iyh
	 N06rcCRTdXCzuScjySCNtopwnLsv7KBMje9yowntsm9A6g8OeHVFH4B2cK4VUWv9YbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=gd8u4DpC4RvoE8YtPPq8fqDhjw3LSFLAZrCNVq9YjRA=;
	b=sQIGQ6/iiZNB4XMLCJidwjRhEUaEBD/fjWFc+cURtWZAvFg5ClH0ZDjDUzr2V5DzYseS
	 4JWaqJUYbG7CfWavWGc0jtzZTeYynzLoaOTjN9VBhD17ITXRdRuctJpFOks3u4/Em8OEZ
	 h7owxXQnrfqD8CNrXW7uzfxyDu331Rd0pvbAipm5BcnfeFI/mchtx77Kv3F8T4GRYMt9R
	 1X5H5nVz11Uy3ONFl7zFvicsslSCTF8ClwZx7VNslEVESPKm5a1UKB0PuITLpyK2TMNIQ
	 7BreXQLWmqWjUMIWiCGep/XS35K8W+hBIm7aJOOS4lEr8gyJB5489cNvcTZ2jtVrlyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zLC5e5FW;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8874F606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8874F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zLC5e5FW
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso2210936a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794922903; x=1795527703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gd8u4DpC4RvoE8YtPPq8fqDhjw3LSFLAZrCNVq9YjRA=;
        b=zLC5e5FWJQnWBfqCiXxfmNT4RaBsCPwYnuWmu2EilziawZZN81B6/Nd8aDR1/DRhHY
         1mLyu0jYEBSWcX/m2AElZpCRy3TG2DFrjzG7s9yLnY4410xW5iA6S20bj7JaC3bQ/aEo
         pd8kdeqYDEzONrnsXTJqVneDGKse1WqREIZSrqulPUQcHmv7khVEZpa3yo+BcMz0Ck+s
         1HfTiM0M1eNV3nuJvg0Rl8Vw+cZp3XY9rP0fabymH0wGRa/8MuqH/abSs4c8NhNDfV3Z
         7a6W8suBktJsXclq7WnV8hYoAQWY09B4FxwgZ7qwJ9jShtwKbJnBQbC7GiQIPO6tCzaj
         c04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922903; x=1795527703;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gd8u4DpC4RvoE8YtPPq8fqDhjw3LSFLAZrCNVq9YjRA=;
        b=1OPFCIdX1MO0YgbRk5AFnWCPDHGUfIpqt+fb+ycBWKouOK128y/hO+JbS3rSvZFkAL
         dCEYZWxMADK0qBqXI/FxwMgF36ChEDukKrZf6lZSEjZ0LpnjK9BISxBkz+YLF3122nZL
         D8Ylki5tFAkIS3Wi+a8hPrJd6K2v/6EhcsFCIYzCVpDZSYXjY4XpxVT1MrjaeYampmHk
         UPXSb/KKbhzn4x7jANpQPqZ6rEQXuNIsgNAqeqhxcXYyqQ5P+/GhRnImcEtNj2whpMH0
         ztYz4nqfWqJClHSPOnqlpGVnZlGWE90HXaBN+ZF0OSmQeNpAJ+NxyISbjqXwL1tw3l/K
         5oUQ==
X-Forwarded-Encrypted: i=1; AL+hErHyxaBWD/EoEyPe/qM0SjHYAHPIU6PIXa9dkHve/wkB4tm+YdWwuMfUO0vxtUUAGW7TbDQURftkhvHUgB0=@vger.kernel.org
X-Gm-Message-State: APuU4Z81TyG7dq0ENzHhIjmjFZWy4kIPT97HSktavHS1xc47dmFhNYsy
	dkuc9ukqgYRPBXbYmdCGftVWD54dztl7rIh79oB5/v5cMsS1d13nqRz5
X-Gm-Gg: AZFdTZeLCmeSZvbd59B9iPtoCSuLOnp281XBivehHbWc7ac9qDQx9S22mj50f3VnyOH
	G5PyH9RTBZsxYfSwfAMguzehC8oOnzOJ1BaOK+BtEFvjjJOTyGthokXU4hKrJQi6Nx/h5WRZfRX
	IH1Q0QddAzUm/xV7k9mkBVo7CahKrK3H447XgNOaTSZqzckqUU/YI1DF2FNkh9g7RGqmArX83ei
	cfeZgy+VEi0wu7MoZ8cDydOYqlG9n9CdS+boSrYOEFYn1xS6Dpt/NPx7rKVQnki70UrDhOCwogl
	ZwXIgqkiYcJ/FtzCO0ttZ3jGLN3LVNFtBuyBCLI9mKD9RVW2qJ112fR2+whWiol6XjEn7zz/MTu
	0ykEiYKppVzvYLnH6AqNw5PsFTSPku97ADkZKlZzsJS8utZ2HiQlh9D6WCnpt4YI2fvN6Tvg46j
	jK4/oN5E9l7WRPqbVWbChu66P/mEyObQfajGfJNhNDakkyY1AIGV2fQL+Zu9940rYeBpWVBvU4i
	vN/db95IlPdLy1vaS8TtYq8nnNimQgwIb8T/KuKFxGPCWo1/jCp3z4fytfHJq6WiEaQEPLDkDKF
	ZUwTYc7DcYOb/miVdIkxiFuU7HVYphnVYdjeZ//5BQ==
X-Received: by 2002:a17:90b:2e47:b0:3b0:9317:5849 with SMTP id 98e67ed59e1d1-3b1b07e9b25mr10928260a91.1.1794922902805;
        Tue, 17 Nov 2026 05:41:42 -0800 (PST)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2cca15sm4158773a91.11.2026.11.17.05.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:41:42 -0800 (PST)
From: Daehyeon Ko <4ncienth@gmail.com>
To: akpm@linux-foundation.org,
	dhowells@redhat.com
Cc: jarkko@kernel.org,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] assoc_array: discard shortcut when collapsing a leaf-only node
Date: Tue, 17 Nov 2026 22:41:20 +0900
Message-ID: <179492189322.898945.11218563093551350188.assoc-array-status@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925080548.2505640-1-4ncienth@gmail.com>
References: <20260925080548.2505640-1-4ncienth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
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

Hi,

A status update for this thread:

This patch was posted on September 25, reviewed by Jarkko, and is now
commit 37ff457ec467 ("assoc_array: discard shortcut when collapsing a
leaf-only node") at the tip of mm-hotfixes-stable.  It has also been
carried in linux-next.

Mainline commit 48691075b0ad ("assoc_array: don't chain a new shortcut
onto an existing one") has since been merged through 666539eecdf4 and
backported to the stable kernels.  As I understand it, the two patches
address the same consecutive-shortcut topology at different points:
37ff457ec467 removes the preceding shortcut during deletion collapse,
while 48691075b0ad replaces that shortcut when insertion would otherwise
put a new shortcut behind it.

The recent linux-next conflict with 1dbbde3bc4b8 ("lib: Remove
assoc_array") prompted me to record the relationship here.  This message
is not requesting a code change; it is only intended to connect the
public histories.  Please let me know if I have misunderstood the
relationship between the fixes.

Regards,
Daehyeon
