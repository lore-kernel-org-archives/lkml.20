Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113179;
	b=p1kaduM5BLOYNu2yb4fXzUiZ/2n0IdZJATf4/+Unz8osfVS0tgaElmNVwCBYQ0YlLxTY
	 Ve0OJruPb3bXKPduvIaMfrIo3T5+QUdCzAB1vpA5usu9ZGWV/9P4HT3UQEdTXTTdVwqR4
	 OzUUysF7H4FY8uYvD66+cjRyELChtyYyONbBKE4stKB/0ZAH7+ZUVcFsV28HmNWGoJjEv
	 0+nkSWboBPWYKzwkOdLjaAW1bUWNRYFuZ9nR+XbchJUvr+dotvGVd+0adggYavbfnZuB2
	 zAh2NWwWEEw08pyq87xD1k4KuakCQvqe/7Qnn0nqfGt45hT3ZTymTRWGvZMnj8HzMkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pQnZKohhKn8+pEI0FIuuVeh0dvpTD8ARh2TOC7gAMuk=;
	b=qiqVevTPFOKo0TAjwgO0bQvPfYwOaL70jQiru1uiz2I9BPtlRtyPQzLSK9Ocihw4+day
	 TaoU3s87jQs5dcGEHoH1bVoiYAWV9uq5qiCJibA+e3eoIFtsDPB5q0tNWN4FwALrm4vC1
	 l1xtK4wQ4BqLR3/Uv4KwYjq2zL3JNOoc5ym0qmqx+r2U0606yOs49S90/2Z5Aiv0G0bVJ
	 p53KFasZ87DAs/vuuF/7jXEuWOxLBt6DgVblGaiRW1ayGB7CRgzyn0Vzf9Xtp8SMVWL/N
	 dzQRxTK1jVcEVG0yKt9XPJxLFo6QyQTtjUjECejuBlkCaQXxRmqKf5Qwb+QixT45RZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PtA5X0ob;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306F8606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 306F8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PtA5X0ob
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso33380585e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793113177; x=1793717977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pQnZKohhKn8+pEI0FIuuVeh0dvpTD8ARh2TOC7gAMuk=;
        b=PtA5X0obxy6xVaDlDPB99APLaMrh1MYRYkUqiGieR9ukCVxnUVwjLtBJS3vDzJ4IFG
         +7JHC52lSSpz1Zg1HGxWZDW4UyRYXNbY8KM8NviocDewzmAfGQMwatwxAePcRfuQ3Lte
         JoJOFqHG2oq81HH1Sn5I5utAzkkxOcPZLDIGWgrQuMISWPmIwXwXsYaanwxupuBST7xc
         k+P1Bb1MrVch/zKIbfgol1eN3oeY79yODeKHswcttr+VsIZD7C63qxWYimhvRn4li+jh
         3yyFbEKo6oWffENkCNEeyEPBbEMKWwDk5h99JVewxg8MEGx9KEuPQhVaKOPUljdvm/n6
         qOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793113177; x=1793717977;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQnZKohhKn8+pEI0FIuuVeh0dvpTD8ARh2TOC7gAMuk=;
        b=nr1m2h18pqJORr1U60bd8Erwu9okLQWBeu2q0adGM74RDxh6eQ4PnLPNaCScuSCD17
         ya6xltgArTRdIpKZrrWji0gVexii6eZYhxoRyy3iOTH7zG6JPOSgX7PbanklM30L9aN/
         VM+rD3svoE57zkHZ7iAVQq0lc1SGy4ABnmMW2iDghag8cTcBsJf6Ez+XCfW5/cWdsDqO
         64efljVQaF6Y2zz3jDkHsAROhoo6F1ovuM0kZ0p9R0ZzcoT/C9H1mKCYTzYWrfn4ML2a
         qRkTF6LjiSGII+47dUIV2qVoSrNJKJviJanIyvSDYYrdf4RvhqNQfDD+EpiB5RMJ0J+N
         nRwQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+/m5h1Gj4NZhOXQ9ZNw1wr8QgSCwf1kf3uiToOitZRq7uSGsrT6yJe7IYexl7pSU1ma9UWR/LcB1wt8U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWq2WMZ2YOTNCPpbeYKor0TsyahsxO0YAacAous58m/NtGZJPg
	HInMtN8jcPAITr+q/uI5COP7d/W+RGgrzIzmXcutz+do2DGxhyvL0bunbbVNFWGkdlKjjPqZM/y
	4huHUwuM=
X-Gm-Gg: AYBFou0M2vQ/O0Sy9PDYxXcwhiMqiOkHaDiUcl/9oy08FhfGjV9Y3sFlcnONL4/WIFF
	481hlN5MfPs+hRyvP1HoebaPv9PSN1NeDncYmdHfZ0rQH+jm24jm7mCbVFXShwcche8u9KBU2uN
	YlA7OANYgl44uk05pG9uCPJh1wiF8NTERYuYgHYmZa5fag/bByKkIxlazAM6U+0XT/p81Jsk/F8
	lDonm6P92YEf0kZ/JnfsfUwyEEp8OYyfcCZ6DnxTPm63NGL6y4d/ZT0SOq0NZVVPnDvQbZo+Hnn
	BI8yNimlvtTfE+XpwTbQKrAqg3rEjNrhGFFVU7nLOs086FlyKC85hU33GcCo4+TFVTh+o+ajkRC
	ujtZcW84PPOKp/n736+KzF5FfY9jUvImQ9xMBxM+oT2BLsyn0Sc4MXkA2yAWld/ucR01QfRvxOP
	OGrxU1INJmzzRoqE9QcoGqrc6u5MmC0K+CGvXJ3ZLiuntyEpk+iCIWg1c9mDWhlSD4JihvZWmJi
	H3hjCswVTmhJJU9ZmhMtWZr/Xl6XNkst3SW8e7VBpANMw2XA+7OK9kT1w==
X-Received: by 2002:a05:600c:b86:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4a35acab6damr194189045e9.28.1793113177517;
        Tue, 27 Oct 2026 07:59:37 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm21760266f8f.56.2026.10.27.07.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:59:37 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:59:34 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Chris Down <chris@chrisdown.name>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add new "printk" mailing list for PRINTK,
 PRINTK INDEXING, and VSPRINTF
Message-ID: <auC8VnnrRABUwOoO@pathway.suse.cz>
References: <20261026160128.12581-1-pmladek@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026160128.12581-1-pmladek@suse.com>

On Mon 2026-10-26 17:01:28, Petr Mladek wrote:
> Reference the new "printk@lists.linux.dev" mailing list for PRINTK,
> PRINTK INDEXING, and VSPRINTF subsystems.
> 
> Signed-off-by: Petr Mladek <pmladek@suse.com>

JFYI, the patch has been committed into printk/linux.git,
branch for-7.4-fixups.

Best Regards,
Petr
