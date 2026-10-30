Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.189.79.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375702;
	b=m4R7uQbRD11xI8+EWViu8c4lI8BeX4oj9qwYgHc+31aZvlWvbx70UQNAO48bo9laJFdm
	 hdl0EachsKxdah4wUZLWeoOhxEEc+D2MEas41dVOI1jsc/VpVQAbzYfGbanoWGcPQmcji
	 nXjV2HiWbKm87BrrE9JV3KG++Vg1NXJ2dK5/n/t2JhvN7vq9GwChkJOdoA48mnYwlkA3i
	 tB3OEOjKzc1L5wYvDT6vW9d5oU8UYakTxMx+Ntjfc33xVsa6suRo7KlCspsy+SvrOjunB
	 5jP9gZPm5VkTKXeexh91XP9bZZ3KJNbReDaBXV105tX3yegzWnKhXfTrSKAJ3fxCt2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375702;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=Wv29Qx0aeR1lksw1UpUnA+E8l4SNVg52Y+DrNRK5B5o=;
	b=HP9tyrbyXgtJPmWRT51sdsvBwyE9M58rYXJDxAE2BEabWfCVVmbnOtt4UxHimjObJHWg
	 nUp4Xa7o0CByz4FcArNt7N6FK8lnK+rWFpz6QgKtlTyBTm+u0omb2Ggdb3rCim88dhuRD
	 qPlVsik20xlCsVcRhXoKGxct9aoNnwBo2jc7l/cv2C02FIS0OLgJrZqGlSgTUBTVpgrQ9
	 UkIidbj6ywqA0JwCb1Ryo7vrtydTvJc/j/fqzKBGgcD2Omg5OWCtTWz3qvTY/E4j81Ba6
	 /sxqu9ctDZUtZ/+zGcg+MAm0zs5qoQTU8en2ku7AnV/xLXE862ka20yWjdCZviq+C1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=206.189.79.184
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69DE4606A31D;
	Fri, 30 Oct 2026 15:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69DE4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with UTF8SMTP id IAEQrMAGT6XQveRqIwJWAQ--.61310S2;
	Fri, 30 Oct 2026 23:54:56 +0800 (CST)
Received: from hust.edu.cn (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCnrzvNveRqGMoMAA--.22894S2;
	Fri, 30 Oct 2026 23:54:55 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dongliang Mu <dzm91@hust.edu.cn>
Subject: [PATCH v2 0/2] docs: Update Sphinx dependency checker
Date: Fri, 30 Oct 2026 23:54:50 +0800
Message-ID: <cover.1793375024.git.dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
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
X-CM-TRANSID:IAEQrMAGT6XQveRqIwJWAQ--.61310S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoWrKrWruFyxJF15WryDXF1DWrg_yoWxurbE9F
	Z3tFyxAa1UAF9FyasrCF1fJryruw4xtF1UCFn5XFW7ZF97Ar4DXF1kJrWvvwn7uF1Syr13
	J3Z5J34rKw42gjkaLaAFLSUrUUUUnb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbd8YjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUAV
	WUtwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr
	1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2
	xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2Iq
	xVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jfvtZUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Add Deepin to the distributions that receive Debian-style dependency
installation hints. Correct typos and awkward wording in comments and
docstrings in the Sphinx dependency checker.

v1->v2:
- Patch 1: keep the Deepin change unchanged and add Mauro's Reviewed-by.
- Patch 2: limit the wording fixes to comments and docstrings. Drop the
  v1 changes to printed messages and command-line help, and add Randy's
  Acked-by.

Dongliang Mu (2):
  docs: Recognize Deepin for dependency hints
  docs: Correct comments in Sphinx dependency checker

 tools/docs/sphinx-pre-install | 53 ++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 26 deletions(-)

-- 
2.51.0

