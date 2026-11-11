Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383626;
	b=YOOiupaYex2Ct0p9LeVdSV76N8Jdo3/aA+DLE46bAqLfq8V2tBTWjJvQHnBoGgW7BVPR
	 vUPhbxxHSoHYSp/GG37OWJ0QD/2j5R40rDZ2HnQ9EFHiAPGb0RZ365xTsLK1tUo8txAK6
	 qBFfXeLcIqUymYWeUnZfvFOi8dWRPQT8SprKzmp/2NIRAgQkbVNXbAndcHjiQl9v00fbY
	 229wd0ewof6YjmM+aWetEDvABdZQ0GdsO1sECOzu5WlKb1rSvXbXHjROYP2rCFqXaWvuZ
	 bjl8O/hLX4hFlxc5I+9R15neYiqV2DtcpR6COjOleFgJskA3MH4Ur+c7XWF2AWJvAMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=dTOr68dqd9pXsH3sDySoD8YNtJ+vod0XkUHzER129hw=;
	b=jCLNBH6ykiGUTmunuUbiYFf20VHNf58Up4kTufl2RoRD3MZrJ9UdU4cmgQXINSecDkwe
	 u5TpbUYwsub6FrSHmieVWoHU6RJ7E+MXnYx3RcyURl3CpRx+GL0ZqSvfYsdZg9L6R33Yy
	 4WgXB1E4Zkbn5V/RL5V/jK2RYB7v+9m9h1zO916ORuiqILMuexcjFyyjZp7TGjUkpsbBK
	 rGaW+1Ckhowx4lDUBDeVtDCWoMFU7hM7JSe5YQ3KmilDlxKJ4mlKXoMr+5g84mi8iEyyq
	 jpmw3FjfNSU1pY9CDDw2poHZYJ12dw9G/9FMvES6qvsKy0OLP90IIk98/NPsXQfKbwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=c2OEhHvm;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C058606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C058606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=c2OEhHvm
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so22217465e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383624; x=1794988424; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dTOr68dqd9pXsH3sDySoD8YNtJ+vod0XkUHzER129hw=;
        b=c2OEhHvmER3+RZdFGbo6s/3sc/wn863f4xlIqCDTNcNCkBfkQMKkhrp9MIDIJdMHJ5
         gn5vAGI08jqoP/CuW2e9fdcilkN78XuU1mWqLv9aEgCHB/Mw4dz+qMVHvd5kxhmAq7Xe
         WQnWwjfTwZpAILgiIKAhoBJn8CwuHQ+7Z6CmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383624; x=1794988424;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTOr68dqd9pXsH3sDySoD8YNtJ+vod0XkUHzER129hw=;
        b=dKiZi5XkSG+eL5bbzLLurjhr0T8TXb6uD5G+fqvgILzZJo0phrOiyl5tEWxvHkVGI4
         hy6XjCVzbtfsCHTtGv6E0LN9du1scxvxZsBPDKfbUt1lr4TyOhysiuOjSxgv+w4lJefn
         ntRsB8V5kf3ssTC4rEf9wI1LULta/aOHqSrbIyphAgkwDauwuKQ5IEjP6AZfx1m+tsBE
         p7ivT10gxwJoe0ONIZgKyloOQDKrnwqBsbuiYV156f4BQvh7jbwrO3zxVXUJr5RsMD1b
         RlS8wEKeLFAGuPzutZVK4J89/9xzuSW+qAiF167eQnZzPJEsS7Tj7et4r9oM+weeubuQ
         mhPw==
X-Forwarded-Encrypted: i=1; AL+hErHPBFscGmnNRIyHFEGTjZaEXFlOezaqPM9SyEVD6usHeuwqaBX6MgDB6NtPuXgNrYmJJ+cnPdXjrp9IlGU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kGVEOILNFa/0YXbd5eXLhHwflxv6KCbcooaVKulO5uMzi11Vg
	iZTqWmd1wInsQg10YnJv4NUnkJsMPDw1+S39U0aXaPWDwf2QPvD3zng6V9xayHhp9do=
X-Gm-Gg: AYBFou3YWItjkuoQJHEwjL/3L+urpHOm79IHINp8OFNJOV7Fc52RWYxtW/lpcamdluR
	lsd2RLgmkLXtc9MkA0wCh6LePInTtZCbkyccfinJ0vwp/oug7KL0kvmaPMdbeutA1GzIP2eS2A1
	ctftYZVhrMqEEXBTKxpgM1sgCeUsBSO3MHN9aJpHm4QqGx3IJjiMum8qZnPxjnEEc8VPtjG9yXG
	ipEhs9xGqVnXOmD54Z3u5YOJIEnzxmxSzsa5UvjnphEje33L0MZFuC4+ZaFqbOHyW13HU8MYNiC
	K/+m8XRy9mXULs/loPGGHOMHznZNnzpBcvwBKKun6GSxOEjvjChkh7fM09ceHRxjNIcxUDfLgI9
	nbt7VZ2IItQ1+CELD9LWWbE1p9doqP9OMeIQ27GMNuRYGTOvDyZihB8mxEabRI0YuA9fzBJBEol
	18pa6KgDDCgSIKxGwUruquvP8AD1AxQ4sqaC8MgvRCAQ7r0FdpowhldPw0WdWLypiT+nhW7SfCP
	0B2Lxblze2G4N10IPdwwR+sP6+0AFfMCXXvOjSDQu0k3uQefM60M/E0nt5g+ukUP3huDsxEU3B6
	DjbD2+lQPqdkkPiG6eMfmU7ynOoH0L/KjpT3ieZOkDdSv0gAT+RZ/ml4Jv9zOr2M/GRnVsFjcwX
	VxV84XwXLXwLbozIxeT9eOg6hqmPe5aYX+XGfoxJUgzggcWMbvRUFA8jem9IGRWDfWuwvEzyKO3
	Nd+s2+frbtQn0V1rJ01e0xhCS5WDlRXqyC8qZSF6Asrm6FsQZAF3UX
X-Received: by 2002:a05:600c:a00d:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4ba093acadfmr26469595e9.34.1794383624548;
        Tue, 10 Nov 2026 23:53:44 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm138135715e9.15.2026.11.10.23.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:53:44 -0800 (PST)
Date: Tue, 10 Nov 2026 23:53:41 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 8/9] liveupdate: Expose the sequence number for consecutive
 live updates
Message-ID: <6f10302874805eccc3960531194c989cdd1588c4.1794383544.git.chris@chrisdown.name>
References: <cover.1794383544.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1794383544.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Export LUO's live update sequence number, so that fleet monitoring can
compare hosts on their first live update with hosts that have been
through several.

We want this because some bugs, like memory corruption, may only show up
after several live updates in a row.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 Documentation/ABI/testing/sysfs-class-misc-liveupdate | 9 +++++++++
 Documentation/userspace-api/liveupdate.rst            | 1 +
 kernel/liveupdate/luo_core.c                          | 8 ++++++++
 3 files changed, 18 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-misc-liveupdate b/Documentation/ABI/testing/sysfs-class-misc-liveupdate
index 608f788ef0fa..b0ba0f626793 100644
--- a/Documentation/ABI/testing/sysfs-class-misc-liveupdate
+++ b/Documentation/ABI/testing/sysfs-class-misc-liveupdate
@@ -24,6 +24,15 @@ Description:	read only
 		the underlying KHO handover.
 Users:		system monitoring
 
+What:		/sys/class/misc/liveupdate/incoming/liveupdate_num
+Date:		Nov 2026
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		LUO sequence number passed by the previous kernel. Reads 0
+		if no LUO state was handed over, 1 after the first live
+		update in a sequence, and increments with each update.
+Users:		system monitoring
+
 What:		/sys/class/misc/liveupdate/incoming/sessions
 What:		/sys/class/misc/liveupdate/incoming/files
 Date:		Nov 2026
diff --git a/Documentation/userspace-api/liveupdate.rst b/Documentation/userspace-api/liveupdate.rst
index 39bbb91d0dd4..61c246371200 100644
--- a/Documentation/userspace-api/liveupdate.rst
+++ b/Documentation/userspace-api/liveupdate.rst
@@ -50,6 +50,7 @@ Monitoring
 
 Read ``/sys/class/misc/liveupdate/incoming/`` to monitor incoming
 sessions and file retrievals without opening ``/dev/liveupdate``.
+``liveupdate_num`` gives the LUO sequence number for the current boot.
 See Documentation/ABI/testing/sysfs-class-misc-liveupdate for the sysfs ABI.
 
 See Also
diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index ba174e9aae03..3ca7b3875247 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -441,6 +441,13 @@ static ssize_t state_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(state);
 
+static ssize_t liveupdate_num_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", luo_global.liveupdate_num);
+}
+static DEVICE_ATTR_RO(liveupdate_num);
+
 #define LUO_INCOMING_ATTR_RO(_name)					\
 static ssize_t _name##_show(struct device *dev,				\
 			    struct device_attribute *attr, char *buf)	\
@@ -458,6 +465,7 @@ LUO_INCOMING_ATTR_RO(files_dropped);
 
 static struct attribute *luo_incoming_attrs[] = {
 	&dev_attr_state.attr,
+	&dev_attr_liveupdate_num.attr,
 	&dev_attr_sessions.attr,
 	&dev_attr_files.attr,
 	&dev_attr_files_retrieved.attr,
-- 
2.54.0

