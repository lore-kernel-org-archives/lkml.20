Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383610;
	b=X1Ay/9zXC2f1vZAg8i7taNUUk4WO8IW+3Rd6Q4nGhCVn9nsgX0Oua5dOJBGHXtxBLbQp
	 qkw+Gm9YqIk6hfSsZF4wOpICZForrLAyMzSoLzvLQSddGC3dZMYH35WiaUOrKfelEfpt4
	 c717CSSMeVXqwZKl6OuQ2ur5A2wAOVDZeRncX9LWGIcIkjTTlssgvixEU5+cnaCZyBrFI
	 AUKxcrNnQpPifCdVYU0gfyPx2VQAg4xFn0X8nOTB3O+Q7BtMUrO0iCkr6+cvxeBakt6f2
	 f67rzUWKegizTL63LMP5Byf4fYQAyoUHl1y1iXxv2c7Lf4eA0GE1bjAUDPkB+SzM6hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=pnMzGzAa5g0/2fGWNckudlYHrRY4wmAMpp2a4sY0JEw=;
	b=f4R175Jj3GU6uqoG6CiQSMMWSRnkmNsktrFnH8mJ6TSmSEqi7XrZNHiecsEEQbvz1+qR
	 Xq3AxcHUL1lDxsjIABLtHlsDVuYwto09wrnkdKpwYFPo7oTdjQKHU+VRKPms8igm33rsP
	 xebqKAQOjDjnP/2rJrUEsXaQR7VrPGLIGEHXH61MqUtzBSYpt+okBycXsBAonlfF2IorR
	 7HKujG2HLxNeXXbU2KpIqg0V1sYSXFQw5GsrQNnv0hXAplCKPtnc/NBYbXYSZPe+oHuo7
	 GIkgxO9tbOE2SFGe7LvhGVBC4GEkl/IecwX+oq2yqhQ6Nxh1nxcj6ZvIt44ZexPFM7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=dNqFAY6c;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872A2606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 872A2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=dNqFAY6c
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so22534935e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383609; x=1794988409; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pnMzGzAa5g0/2fGWNckudlYHrRY4wmAMpp2a4sY0JEw=;
        b=dNqFAY6cZ3CyL5eJVVr35UwikSopMOTqlFBpWR/MyFLq9799tN3W3BSglylopd0rYS
         RqKgJy15r+m3b5FB4xABsCe78mdqRMSgupv/nVYWHFL6rGAdW2OGZ6fdVNFTzRC5TePK
         qHrOSaRJcOxBCr4EMtMQRV+q3DlxSSIQJ4FMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383609; x=1794988409;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pnMzGzAa5g0/2fGWNckudlYHrRY4wmAMpp2a4sY0JEw=;
        b=K7q75Uua+vgmJ2kX7k+FKUQAdw5rYUIKKs2cNGH0agR1oFQoQkf/x9j8Q83RQqlguu
         /qd18Qj9HlTd3V75i4Tsx1oHR48rv0Kk92VlnNwIqjhSol27jEHkEyVEKLQsOaqjYDPu
         jI5J0RAaoPUsVw48tUUweu0CZDZfqzHIWGxy/OU/c3WXTlEJix+gJxTAWvKCEmZ/qDUu
         ku9s5IbbOZToHsXdtK6UXMDUEr5lJNTd0Ijuakk6Z1qdjX4JJErWrCHIxGzqAIM4C9qu
         jT0Jhpv7RxOkFekfSyi5NgqEvHjcgAZPWId1iIwlq7WcN3WKQKpz8+jNFsGL+7/Moidd
         5d+Q==
X-Forwarded-Encrypted: i=1; AL+hErH+1eOA8Mm5kjYUeaqzVY+/LngLtTCUL3u3/bxOhXmWc2MaoURorFrRsZ1eZ9iB0bPA80UZZSQa+1T7eG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hP23K0qXEYUbzkHRAnGeImnFbt/CXvOIagsIZ6sr+gW+fSkTg
	9jxiX3MaQGJ9oTUTfZZb0/kAcx20ajt5OVjWrqjM/8K8SCwJUzpPOu2cLRVxS303T3U=
X-Gm-Gg: AYBFou1/Szsqs7sIdD9cZVInPVzH3YNwOlfRE5gwSTUNrO5jWrRnKZZUJUX0Eg0/rxa
	W84cVKNQ7h34uhw6/NqChY4Hkqtcdmhbe1+za0qHmo/UmqIg2hRP+tSrlJXkepF+QlCVrRfLwz6
	UbANEHTWLnLBzefsi5NdZWadMHjGv6wKLAWxKUdkaq2gNuw4eP0HUSxfpJ64n18qtzsnE9TdR2L
	qkClTU5F1df3jr6Xa5KYtHkQtX6nlDTZUQPmpT939PbAaPRc9Pwz5ipVDrq8dwTib5iCA7aBSzg
	jzhKeQ4+GB2aoqhZcw0ehBBu8v8P1mKUVsIWq4YNtaCTfA+bx4iD13xhKoDBsMG26u5Fe0Oc1F5
	Z1OrXW8uKTTcS+FWwCoXL5Uz1KYLRjqiWymD3T2tXypV/9CNSQxFtDpu9VHVnn/M1DDneBpcMJm
	TdtOAdow0ZTBwhglBPpzCK3IpF6d/sjSbx3XKJKMbe+DKCOpnlkXMLwvTP/cydiBOslC+Hxd88D
	rqU5QAi1ZLlmEpyaBiA4e34sdngR3O5cTNg2Ysp404wdp4t4QpO+9EUG6YnIrJbw9FyLw2y/3j+
	Emuqt6oODlAlwch9fPKfzPjBCzg2xJ/+WOdFpyFyu/+AkN0MTPtNp0AzjAljfx4YZugsiPVHJY+
	XOIK/S7XZtBif/i4Q0+OoVtK+0GLyI4nVeJYpbWeUspu7eQDyL8BinIYQPOIdV4yfBLovhzgmfY
	FyLXuLiqRWMnlJJ/TIHV0n2GM5tG9CVUGfO2bgSw97nsJBtBOm7CpT
X-Received: by 2002:a05:600d:16:b0:4ba:4395:56c9 with SMTP id 5b1f17b1804b1-4ba439561a5mr11281775e9.26.1794383609006;
        Tue, 10 Nov 2026 23:53:29 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49842f2a1f9sm9790339f8f.15.2026.11.10.23.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:53:28 -0800 (PST)
Date: Tue, 10 Nov 2026 23:53:25 -0800
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
Subject: [PATCH 5/9] selftests/kho: Catch missing or zero bootmem reports
 before kexec
Message-ID: <2edf50f498070047a363420b890cb7ff0294b87b.1794383544.git.chris@chrisdown.name>
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

The KHO vmtest can pass even if the bootmem size is no longer visible to
userspace. Let's fail if /sys/kernel/kexec/kho_bootmem_size can't be
read or reports zero on the KHO-enabled boot.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 tools/testing/selftests/kho/init.c    | 24 ++++++++++++++++++++++++
 tools/testing/selftests/kho/vmtest.sh |  1 +
 2 files changed, 25 insertions(+)

diff --git a/tools/testing/selftests/kho/init.c b/tools/testing/selftests/kho/init.c
index 88a41b6eba95..ca9297d896d3 100644
--- a/tools/testing/selftests/kho/init.c
+++ b/tools/testing/selftests/kho/init.c
@@ -18,9 +18,30 @@ static int mount_filesystems(void)
 	if (mount("debugfs", "/debugfs", "debugfs", 0, NULL) < 0)
 		return -1;
 
+	if (mount("sysfs", "/sys", "sysfs", 0, NULL) < 0)
+		return -1;
+
 	return mount("proc", "/proc", "proc", 0, NULL);
 }
 
+static int check_bootmem_size(void)
+{
+	char buf[32];
+	ssize_t len;
+	int fd;
+
+	fd = open("/sys/kernel/kexec/kho_bootmem_size", O_RDONLY);
+	if (fd < 0)
+		return -1;
+
+	len = read(fd, buf, sizeof(buf));
+	close(fd);
+	if (len <= 0)
+		return -1;
+
+	return buf[0] == '0' ? -1 : 0;
+}
+
 static long kexec_file_load(int kernel_fd, int initrd_fd,
 			    unsigned long cmdline_len, const char *cmdline,
 			    unsigned long flags)
@@ -61,6 +82,9 @@ int main(int argc, char *argv[])
 	if (mount_filesystems())
 		goto err_reboot;
 
+	if (check_bootmem_size())
+		goto err_reboot;
+
 	if (kexec_load())
 		goto err_reboot;
 
diff --git a/tools/testing/selftests/kho/vmtest.sh b/tools/testing/selftests/kho/vmtest.sh
index 1e86ffcc3a79..e3e99cfe3ac1 100755
--- a/tools/testing/selftests/kho/vmtest.sh
+++ b/tools/testing/selftests/kho/vmtest.sh
@@ -95,6 +95,7 @@ function mkinitrd() {
 dir /dev 0755 0 0
 dir /proc 0755 0 0
 dir /debugfs 0755 0 0
+dir /sys 0755 0 0
 nod /dev/console 0600 0 0 c 5 1
 file /init $tmp_dir/init 0755 0 0
 file /kernel $kernel 0644 0 0
-- 
2.54.0

